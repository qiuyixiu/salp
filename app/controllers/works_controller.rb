class WorksController < ApplicationController
  impressionist

  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
    impressionist(@work)
  end
end
