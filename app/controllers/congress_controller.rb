class CongressController < ApplicationController
  def index
  end

  def csv
    flash[:alert] = "Estamos processando as informações"
    render "index"
  end
end
