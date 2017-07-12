class Account::OfferCollectionsController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @offer_collections = current_user.participated_offers
    @user_offers = current_user.offers
  end
end
