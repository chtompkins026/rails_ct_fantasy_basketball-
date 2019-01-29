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
    @league = League.create(league_params)
    if @league
      redirect_to league_path(@league)
    else
      render :new
    end
  end

  def show
    @league = League.find(params[:id])
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

  private

  def league_params
    params.require(:league).permit(:name)
  end

end
