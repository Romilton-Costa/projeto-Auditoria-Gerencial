class InfraestruturasController < ApplicationController
  def index
    @cpu_por_cliente = {}
    @memoria_por_cliente = {}

    Client.limit(45).each do |cliente|
      @cpu_por_cliente[cliente.name] = rand(10..90)
      @memoria_por_cliente[cliente.name] = rand(20..95)
    end
  end
end
