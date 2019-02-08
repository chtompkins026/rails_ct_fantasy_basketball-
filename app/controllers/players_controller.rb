class PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
  end

  def index
    @players = Player.search(params[:search])
    @team = Team.find(params[:team_id])
    @league_id = League.find(params[:league_id])

    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def create
    @team = Team.find(params[:team_id])
    @player = Player.find_by(id: params[:id])

    unless @player.player_leagues.pluck(:league_id).include?(@team.league.id)
      @player_league = PlayerLeague.create({league_id: @team.league.id, player_id: @player.id, utility: params[:utility]})
      @player.update(team_id: params[:team_id])
      @player.save
      redirect_to team_path(@team)
    else
      flash[:error] = "Can't Add Duplicate Player!"
      redirect_to team_players_path
    end
  end

  def destroy
    @player = Player.find_by(id: params[:id])
    @team_id = @player.team.id
    @user = @player.team.user_id
    @pl = @player.player_leagues.find_by(league_id: @player.team.league_id)
    if @user == current_user.id
      @pl.delete
      @player.update(team_id: nil)
      @player.save
      redirect_to team_path(@team_id)
    else
      flash[:error] = "Can't be droping players not on your team"
      redirect_to team_players_path
    end
  end


  private

  def player_params
    params.require(:player).permit(:name, :position, :nba_team, :points,
      :team_id, :search)
  end

end
