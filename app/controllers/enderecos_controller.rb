class EnderecosController < ApplicationController
  def index
      @enderecos = Endereco.all
  end


end
