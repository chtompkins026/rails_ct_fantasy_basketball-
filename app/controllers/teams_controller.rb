class TeamsController < ApplicationController

  def show
    @team = Team.find(params[:id])
    @user_id = @team.user_id
    @players = @team.players
    @league = @team.league_id
  end

  def index
    @league = League.find(params[:id])
  end

  def new
    id = params[:id].nil? ? params[:league_id] : params[:id]
    @league = League.find(id)
    @team = @league.teams.build  #can't create a random team, need to associate with league
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    if @team.save
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Successfully created team!"
      redirect_to team_path(@team)
    else
      flash[:error] = "#{@team.errors.full_messages.join(". ")}"
      redirect_to league_path(@team.league.id)
    end
  end

  def destroy
    team = Team.find(params[:id])
    user_id = team.user_id
    team.players.each do |p|
      player_league_help(p, team, user_id)
    end

    team.destroy
    flash[:success] = "Successfully deleted team!"
    redirect_to user_path(user_id)
  end

  private

  def team_params
    params.require(:team).permit(:name, :league_id, :user_id)
  end

  def player_league_help(player, team, user_id)
    if player.player_leagues.pluck(:league_id).include?(team.league.id) && user_id == current_user.id
      player_league = PlayerLeague.find_by({league_id: team.league.id, player_id: player.id})
      player_league.destroy
      player.update(team_id: nil)
      player.save
    end
  end

end
