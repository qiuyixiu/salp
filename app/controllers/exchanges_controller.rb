class ExchangesController < ApplicationController
  impressionist

  def index
    @exchanges = Exchange.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @exchange = Exchange.find(params[:id])
    impressionist(@exchange)
  end
end
