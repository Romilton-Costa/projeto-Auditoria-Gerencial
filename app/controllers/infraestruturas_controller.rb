class InfraestruturasController < ApplicationController
  def index
    
    service = ZabbixMonitorService.new
    @hosts = service.fetch_and_format_hosts || []
  end
end
