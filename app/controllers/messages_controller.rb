class MessagesController < ApplicationController
  impressionist

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
    impressionist(@message)
  end
end
