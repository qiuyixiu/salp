class MessagesController < ApplicationController
  impressionist

  def index
    @messages = Message.where(:is_hidden => false).order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @message = Message.find(params[:id])
    impressionist(@message)

    if @message.is_hidden
      flash[:warning] = "这篇动态信息在审核中！不可看！"
      redirect_to root_path
    end
  end
end
