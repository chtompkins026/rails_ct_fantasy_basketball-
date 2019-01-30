class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
  end

  def index
  end

  def new
  end

  def edit
  end
end
