class ListsController < ApplicationController
  impressionist

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    impressionist(@list)
  end
end
