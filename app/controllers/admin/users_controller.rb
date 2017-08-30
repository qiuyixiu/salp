class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @users = User.order("created_at DESC").page(params[:page]).per(20)
  end

  def edit
    @user = User.find(params[:id])

    if @user.update(use_params)
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
