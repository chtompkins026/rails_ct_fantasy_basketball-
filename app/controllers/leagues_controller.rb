class LeaguesController < ApplicationController

  def new
    @league = League.new
  end

  def index
    @leagues = League.all

    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def edit
    @league = League.find(params[:id])
  end

  def create
    @league = League.new(league_params)
    if @league.save
      redirect_to league_path(@league)
    else
      flash[:error]="#{@league.errors.full_messages.join(". ")}"
      render :new
    end
  end

  def show
    @league = League.find_by(id: params[:id]) || League.find_by(name: params[:id])
    @teams = @league.teams
  end

  def update
    @league = League.find(params[:id])
    @league.update(league_params)
    if @league.save
      redirect_to league_path(@league)
    else
      render :edit
    end
  end

  def destroy

  end


  def join_league
    @user = current_user
    @league = League.find(params[:id])
    redirect_to new_team_path(@league)
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end

end
