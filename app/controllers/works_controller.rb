class WorksController < ApplicationController
  impressionist

  def index
    @works = Work.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @work = Work.find(params[:id])
    impressionist(@work)
  end
end
