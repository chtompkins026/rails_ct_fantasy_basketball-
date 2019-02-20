class PlayersController < ApplicationController

  # before_

  def show
    @player = Player.find(params[:id])
  end

  def index
    @players = Player.search(params[:search])
    @team = Team.find(params[:team_id])
    @league_id = @team.league_id
    # should only have 1-2 instance variables
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def create
    @team = Team.find(params[:team_id])
    @player = Player.find_by(id: params[:id])

    if !@player.player_teams.include?(@team) && @user_id == current_user.id
      player_team = PlayerTeam.create({team_id: @team.id, player_id: @player.id, utility: params[:utility]})
      redirect_to team_path(@team)
    elsif @user_id != current_user.id
      flash[:error] = "You Can't Add a Player to a Team That Is Not Yours!"
      redirect_to league_path(@league)
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

  # def set_team
  #   @team = Team.find(params[:id])
  # end

end
