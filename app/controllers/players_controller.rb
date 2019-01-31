class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
  end

  def index
    @players = Player.search(params[:search])
    @team_id = Team.find(params[:team_id])
    @league_id = League.find(params[:league_id])

    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def create
    @team = Team.find(params[:team_id])
    @player = Player.find_by(id: params[:id])
    @player.update(team_id: params[:team_id])
    @player.save

    redirect_to team_path(@team)
  end

  def destroy
    @player = Player.find_by(id: params[:id])
    @team = @player.team_id
    @player.update(team_id: nil)
    @player.save

    redirect_to team_path(@team)
  end

  private

  def player_params
    params.require(:player).permit(:name, :position, :nba_team, :points,
      :team_id, :search)
  end

end
