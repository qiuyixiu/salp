class Admin::MessagesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to admin_messages_path
    else
      render :new
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to admin_messages_path
    else
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to admin_messages_path
  end

  def publish
    @message = Message.find(params[:id])
    @message.is_hidden = false
    @message.save
    redirect_to :back
  end

  def hide
    @message = Message.find(params[:id])
    @message.is_hidden = true
    @message.save
    redirect_to :back
  end

  private

  def message_params
    params.require(:message).permit(:title, :description, :image, :is_hidden)
  end
end
