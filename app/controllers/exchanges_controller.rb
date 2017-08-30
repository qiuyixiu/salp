class ExchangesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :join, :quit]
  layout "account", only: [:new]
  impressionist

  def index
    @exchanges = Exchange.where(:is_hidden => false).order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @exchange = Exchange.new
  end

  def create
    @exchange = Exchange.new(exchange_params)
    @exchange.user = current_user

    if @exchange.save
      redirect_to account_exchange_collections_path
      flash[:notice] = "动态信息已提交，待管理员审核后发布"
    else
      render :new
    end
  end

  def show
    @exchange = Exchange.find(params[:id])
    impressionist(@exchange)
    @user = @exchange.user

    if @exchange.is_hidden
      flash[:warning] = "这篇动态信息在审核中！不可看！"
      redirect_to root_path
    end
  end

  def join
    @exchange = Exchange.find(params[:id])
    if !current_user.is_member_of?(@exchange)
      current_user.join_exchange_collection!(@exchange)
    end
    redirect_to exchange_path(@exchange)
  end

  def quit
    @exchange = Exchange.find(params[:id])
    if current_user.is_member_of?(@exchange)
      current_user.quit_exchange_collection!(@exchange)
    end
    redirect_to exchange_path(@exchange)
  end

  private

  def exchange_params
    params.require(:exchange).permit(:title, :description, :image, :user_id)
  end
end
