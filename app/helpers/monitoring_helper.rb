module MonitoringHelper
  # Determina a cor com base na percentagem
  def get_usage_color(percentage)
    if percentage >= 70
      "#ef4444" # Vermelho (Crítico)
    elsif percentage >= 30
      "#f59e0b" # Laranja (Atenção)
    else
      "#22c55e" # Verde (Normal)
    end
  end

  # Determina a cor para o estado do servidor (0 = Ativo, 1 = Desativado)
  def get_status_color(status)
    status == "0" ? "#22c55e" : "#ef4444"
  end

  # Calcula a largura da barra (limitada a 100%)
  def safe_percentage(value)
    return 0 if value.nil?
    [value.to_f, 100.0].min
  end
end