class IndustriesController < ApplicationController
  impressionist

  def index
    @industries = Industry.all
  end

  def show
    @industry = Industry.find(params[:id])
    impressionist(@industry)
  end
end
