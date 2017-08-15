class Admin::IndustriesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @industries = Industry.order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @industry = Industry.new
  end

  def show
    @industry = Industry.find(params[:id])
  end

  def edit
    @industry = Industry.find(params[:id])
  end

  def create
    @industry = Industry.new(industry_params)
    @industry.user = current_user
    if @industry.save
      redirect_to admin_industrys_path
    else
      render :new
    end
  end

  def update
    @industry = Industry.find(params[:id])
    if @industry.update(industry_params)
      redirect_to admin_industrys_path
    else
      render :edit
    end
  end

  def destroy
    @industry = Industry.find(params[:id])
    @industry.destroy
    redirect_to admin_industrys_path
  end

  private

  def industry_params
    params.require(:industry).permit(:title, :description, :image)
  end
end
