class WelcomeController < ApplicationController
  def index
    @introductions = Introduction.order("updated_at DESC").page(params[:page]).per(3)
    @notices = Notice.order("updated_at DESC").page(params[:page]).per(6)
    @messages = Message.where(:is_hidden => false).order("updated_at DESC").page(params[:page]).per(3)
    @offers = Offer.where(:is_hidden => false).order("updated_at DESC").page(params[:page]).per(3)
    @games = Game.order("updated_at DESC").page(params[:page]).per(1)
  end

  def test
    @introductions = Introduction.all
  end


end
