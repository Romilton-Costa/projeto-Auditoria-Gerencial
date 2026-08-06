# app/services/zabbix_monitor_service.rb
require 'net/http'
require 'json'

class ZabbixMonitorService
  def initialize
    @url = URI(ENV['ZABBIX_API_URL'] || "http://161.35.63.175:81/api_jsonrpc.php" )
    @token = ENV['ZABBIX_API_TOKEN'] || "0277b9c8094fae8040c63ba66caa3b351e716679408a54d43b697c018a120c23"
    @id = 0
  end

  def fetch_and_format_hosts
    hosts = fetch_hosts
    items = fetch_all_items(hosts)
    format_output(hosts, items)
  end

  private

  def request(method, params = {})
    @id += 1
    body = {
      jsonrpc: "2.0",
      method: method,
      params: params,
      auth: @token,
      id: @id
    }.to_json

    http = Net::HTTP.new(@url.host, @url.port )
    req = Net::HTTP::Post.new(@url.path, {'Content-Type' => 'application/json'})
    req.body = body
    response = http.request(req )
    result = JSON.parse(response.body)

    if result["error"]
      raise "Zabbix API Error: #{result['error']['message']} - #{result['error']['data']}"
    end

    result["result"]
  end

  def fetch_hosts
    request("host.get",
      output: ["hostid", "host", "name", "status"],
      sortfield: "host"
    )
  end

  def fetch_all_items(hosts)
    host_ids = hosts.map { |h| h["hostid"] }
    
    {
      cpu: request("item.get",
        hostids: host_ids,
        output: ["hostid", "itemid", "name", "lastvalue"],
        search: { name: "CPU" }
      ),
      mem: request("item.get",
        hostids: host_ids,
        output: ["hostid", "itemid", "name", "lastvalue"],
        search: { name: "Memory" }
      ),
      uptime: request("item.get",
        hostids: host_ids,
        output: ["hostid", "itemid", "name", "lastvalue"],
        search: { name: "Uptime" }
      )
    }
  end

  def format_output(hosts, all_items)
    items_by_host = Hash.new { |h, k| h[k] = { cpu: [], mem: [], uptime: [] } }

    all_items[:cpu].each { |item| items_by_host[item["hostid"]][:cpu] << item }
    all_items[:mem].each { |item| items_by_host[item["hostid"]][:mem] << item }
    all_items[:uptime].each { |item| items_by_host[item["hostid"]][:uptime] << item }

    hosts.map { |host| process_host_data(host, items_by_host[host["hostid"]]) }
  end

  def process_host_data(host, data)
    data ||= { cpu: [], mem: [], uptime: [] }
    host_name = host["name"] || host["host"]
    host_status = host["status"] == "0" ? "Ativo" : "Desativado"

    cpu_value = "N/A"
    mem_used_pct = "N/A"
    mem_total = "N/A"
    uptime_hours = "N/A"

    data[:cpu].each do |item|
      if item["name"].downcase.include?("cpu utilization")
        cpu_value = format("%.1f", Float(item['lastvalue']))
        break
      end
    end

    data[:mem].each do |item|
      name_lower = item["name"].downcase
      if name_lower.include?("utilization")
        mem_used_pct = format("%.1f%%", Float(item['lastvalue']))
      end
      if name_lower.include?("total memory")
        mem_bytes = Float(item['lastvalue'])
        mem_total = format("%.0f", mem_bytes / (1024 * 1024))
      end
    end

    data[:uptime].each do |item|
      if item["name"].downcase.include?("uptime")
        seconds = Float(item['lastvalue'])
        uptime_hours = format("%.1f", seconds / 3600)
        break
      end
    end

    {
      name: host_name,
      status: host_status,
      cpu: cpu_value,
      mem_used: mem_used_pct,
      mem_total: mem_total,
      uptime: uptime_hours
    }
  end
end
