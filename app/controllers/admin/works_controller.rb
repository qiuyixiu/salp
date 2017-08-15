class Admin::WorksController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @works = Work.order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @work = Work.new
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def create
    @work = Work.new(work_params)
    @work.user = current_user
    if @work.save
      redirect_to admin_works_path
    else
      render :new
    end
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to admin_works_path
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to admin_works_path
  end

  private

  def work_params
    params.require(:work).permit(:title, :description, :image)
  end
end
