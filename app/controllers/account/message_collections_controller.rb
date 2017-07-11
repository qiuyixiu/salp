class Account::MessageCollectionsController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @message_collections = current_user.participated_messages
    @user_messages = current_user.messages
  end
end
