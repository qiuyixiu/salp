class GamesController < ApplicationController
  impressionist

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    impressionist(@game)
  end

end
