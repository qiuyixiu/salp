class Account::ExchangeCollectionsController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @exchange_collections = current_user.participated_exchanges
    @user_exchanges = current_user.exchanges
  end
end
