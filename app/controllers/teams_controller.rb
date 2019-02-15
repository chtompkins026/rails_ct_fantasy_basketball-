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

  private

  def team_params
    params.require(:team).permit(:name, :league_id, :user_id)
  end

end
