class WelcomeController < ApplicationController
  def index
    @introductions = Introduction.all
    @notices = Notice.all
    @messages = Message.all
  end


end
