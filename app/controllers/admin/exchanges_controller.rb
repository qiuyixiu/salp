class Admin::ExchangesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @exchanges = Exchange.order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @exchange = Exchange.new
  end

  def show
    @exchange = Exchange.find(params[:id])
  end

  def edit
    @exchange = Exchange.find(params[:id])
  end

  def create
    @exchange = Exchange.new(exchange_params)
    @exchange.user = current_user
    if @exchange.save
      redirect_to admin_exchanges_path
    else
      render :new
    end
  end

  def update
    @exchange = Exchange.find(params[:id])
    if @exchange.update(exchange_params)
      redirect_to admin_exchanges_path
    else
      render :edit
    end
  end

  def destroy
    @exchange = Exchange.find(params[:id])
    @exchange.destroy
    redirect_to admin_exchanges_path
  end

  private

  def exchange_params
    params.require(:exchange).permit(:title, :description, :image)
  end
end
