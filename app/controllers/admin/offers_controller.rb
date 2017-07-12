class Admin::OffersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to admin_offers_path
    else
      render :new
    end
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      redirect_to admin_offers_path
    else
      render :edit
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to admin_offers_path
  end

  def publish
    @offer = Offer.find(params[:id])
    @offer.is_hidden = false
    @offer.save
    redirect_to :back
  end

  def hide
    @offer = Offer.find(params[:id])
    @offer.is_hidden = true
    @offer.save
    redirect_to :back
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :image, :is_hidden)
  end
end
