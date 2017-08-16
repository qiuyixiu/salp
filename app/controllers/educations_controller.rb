class EducationsController < ApplicationController
  impressionist

  def index
    @educations = Education.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @education = Education.find(params[:id])
    impressionist(@education)
  end
end
