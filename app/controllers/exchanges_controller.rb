class ExchangesController < ApplicationController
  impressionist

  def index
    @exchanges = Exchange.all
  end

  def show
    @exchange = Exchange.find(params[:id])
    impressionist(@exchange)
  end
end
