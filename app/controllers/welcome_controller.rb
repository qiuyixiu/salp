class WelcomeController < ApplicationController
  def index
    @introductions = Introduction.all.page(params[:page]).per(3)
    @notices = Notice.order("created_at DESC").page(params[:page]).per(12)
    @messages = Message.where(:is_hidden => false).order("created_at DESC").page(params[:page]).per(12)
  end


end
