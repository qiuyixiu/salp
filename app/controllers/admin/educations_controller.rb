class Admin::EducationsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @educations = Education.order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @education = Education.new
  end

  def show
    @education = Education.find(params[:id])
  end

  def edit
    @education = Education.find(params[:id])
  end

  def create
    @education = Education.new(education_params)
    @education.user = current_user
    if @education.save
      redirect_to admin_educations_path
    else
      render :new
    end
  end

  def update
    @education = Education.find(params[:id])
    if @education.update(education_params)
      redirect_to admin_educations_path
    else
      render :edit
    end
  end

  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    redirect_to admin_educations_path
  end

  private

  def education_params
    params.require(:education).permit(:title, :description, :image)
  end
end
