class EducationsController < ApplicationController
  impressionist

  def index
    @educations = Education.all
  end

  def show
    @education = Education.find(params[:id])
    impressionist(@education)
  end
end
