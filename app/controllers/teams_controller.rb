class TeamsController < ApplicationController

  def show
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def index
    @league = League.find(params[:id])
  end

  def new
    @league = League.find(params[:id])
    @team = @league.teams.build  #can't create a random team, need to associate with league
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Successfully created team!"
      redirect_to @team
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
