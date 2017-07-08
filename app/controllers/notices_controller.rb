class NoticesController < ApplicationController

  impressionist

  def index
    @notices = Notice.all
  end

  def show
    @notice = Notice.find(params[:id])
    impressionist(@notice)
  end




end
