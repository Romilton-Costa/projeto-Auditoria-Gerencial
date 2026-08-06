# app/controllers/monitoring_controller.rb
class MonitoringController < ApplicationController
  def index
    # Chama o Service Object
    service = ZabbixMonitorService.new
    
    # Se quiser renderizar HTML, guarde numa variável de instância
    @hosts = service.fetch_and_format_hosts
    
    # Se quiser renderizar JSON (para um frontend React/Vue ou app mobile)
    # render json: @hosts
  end
end