class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :join, :quit]
  layout "account", only: [:new]
  impressionist

  def index
    @messages = Message.where(:is_hidden => false).order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to account_message_collections_path
      flash[:notice] = "动态信息已提交，待管理员审核后发布"
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
    impressionist(@message)
    @user = @message.user

    if @message.is_hidden
      flash[:warning] = "这篇动态信息在审核中！不可看！"
      redirect_to root_path
    end
  end

  def join
    @message = Message.find(params[:id])
    if !current_user.is_member_of?(@message)
      current_user.join_message_collection!(@message)
    end
    redirect_to message_path(@message)
  end

  def quit
    @message = Message.find(params[:id])
    if current_user.is_member_of?(@message)
      current_user.quit_message_collection!(@message)
    end
    redirect_to message_path(@message)
  end

  private

  def message_params
    params.require(:message).permit(:title, :description, :image, :user_id)
  end
end
