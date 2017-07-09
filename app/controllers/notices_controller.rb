class NoticesController < ApplicationController

  impressionist

  def index
    @notices = Notice.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @notice = Notice.find(params[:id])
    impressionist(@notice)
  end




end
