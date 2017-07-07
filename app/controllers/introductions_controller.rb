class IntroductionsController < ApplicationController
  impressionist

  def index
    @introductions = Introduction.all
  end

  def new
    @introduction = Introduction.new
  end

  def show
    @introduction = Introduction.find(params[:id])
    impressionist(@introduction)
  end

  def edit
    @introduction = Introduction.find(params[:id])
  end

  def create
    @introduction = Introduction.new(introduction_params)
    if @introduction.save
      redirect_to introductions_path
    else
      render :new
    end
  end

  def update
    @introduction = Introduction.find(params[:id])
    if @introduction.update(introduction_params)
      redirect_to introductions_path
    else
      render :edit
    end
  end

  def destroy
    @introduction = Introduction.find(params[:id])
    @introduction.destroy
    redirect_to introductions_path
  end

  private

  def introduction_params
    params.require(:introduction).permit(:title, :description, :image)
  end
end
