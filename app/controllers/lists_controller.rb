class ListsController < ApplicationController
  impressionist

  def index
    @lists = List.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @list = List.find(params[:id])
    impressionist(@list)
  end
end
