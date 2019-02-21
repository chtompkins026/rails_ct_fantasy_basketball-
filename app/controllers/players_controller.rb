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
   @player = Player.find(params[:id])
   @team = Team.find(params[:team_id])

   if current_user.owns_team?(@team) && @player.not_on?(@team)
     @player.join(@team, with: params[:utility]) if @team.in_different_league?(@player)
     redirect_to team_path(@team)
   elsif current_user.does_not_own_team?(@team)
     flash[:error] = "You Can't Add a Player to a Team That Is Not Yours!"
     redirect_to league_path(@team.league)
   else
     flash[:error] = "Can't Add Duplicate Players!"
     redirect_to team_player_path
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
