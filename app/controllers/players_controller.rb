class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
  end

  def index
    @players = Player.search(params[:search])

    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def create
    
  end



  private

  def player_params
    params.require(:player).permit(:name, :position, :nba_team, :points,
      :team_id, :user_id, :league_id, :search)
  end

end
