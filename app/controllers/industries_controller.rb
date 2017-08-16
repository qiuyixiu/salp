class IndustriesController < ApplicationController
  impressionist

  def index
    @industries = Industry.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @industry = Industry.find(params[:id])
    impressionist(@industry)
  end
end
