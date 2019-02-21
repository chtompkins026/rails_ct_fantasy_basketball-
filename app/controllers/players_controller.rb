class PlayersController < ApplicationController

  # before_

  def show
    @player = Player.find(params[:id])
  end

  def index
    @players = Player.search(params[:search])
    @team = Team.find(params[:team_id])
  end

  def create
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:id])

    if authorize_team(@player, @team) && authorize_user(@team.user_id)
      player_team = PlayerTeam.create({team_id: @team.id, player_id: @player.id, utility: params[:utility]})
      redirect_to team_path(@team)
    elsif !authorize(@team.user_id)
      flash[:error] = "You Can't Add a Player to a Team That Is Not Yours!"
      redirect_to league_path(@team.league_id)
    else
      flash[:error] = "Can't Add Duplicate Player!"
      redirect_to team_players_path
    end
  end

  def destroy
    player = Player.find_by(id: params[:id])
    team = Team.find_by(id: params[:team_id])
    pt = player.player_teams.find_by(team_id: team.id, player_id: player.id)
    if authorize_user(team.user_id)
      pt.delete
      redirect_to team_path(team.id)
    else
      flash[:error] = "Can't be droping players who are not on your team"
      redirect_to team_players_path
    end
  end


  private

  def player_params
    params.require(:player).permit(:name, :position, :nba_team, :points, :search)
  end

end
