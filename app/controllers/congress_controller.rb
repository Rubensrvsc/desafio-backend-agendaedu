class CongressController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def csv
    Business::RegisterValues.new.call(params["csv"].tempfile.path)
    # Workers::RegisterExpenses.perform_async(params["csv"].tempfile.path)
    flash[:alert] = "Estamos processando as informações"
    render "index"
  end
end
