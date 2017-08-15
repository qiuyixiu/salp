class Admin::ListsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @lists = List.order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to admin_lists_path
    else
      render :new
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to admin_lists_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to admin_lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :image)
  end
end
