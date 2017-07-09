class Admin::IntroductionsController < ApplicationController

  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @introductions = Introduction.all
  end

  def new
    @introduction = Introduction.new
  end

  def show
    @introduction = Introduction.find(params[:id])
  end

  def edit
    @introduction = Introduction.find(params[:id])
  end

  def create
    @introduction = Introduction.new(introduction_params)
    @introduction.user = current_user
    if @introduction.save
      redirect_to admin_introductions_path
    else
      render :new
    end
  end

  def update
    @introduction = Introduction.find(params[:id])
    if @introduction.update(introduction_params)
      redirect_to admin_introductions_path
    else
      render :edit
    end
  end

  def destroy
    @introduction = Introduction.find(params[:id])
    @introduction.destroy
    redirect_to admin_introductions_path
  end

  private

  def introduction_params
    params.require(:introduction).permit(:title, :description, :image)
  end

end
