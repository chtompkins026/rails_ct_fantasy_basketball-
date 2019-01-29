class LeaguesController < ApplicationController

  def index
    @leagues = League.all

    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def new

  end

  def create

  end

  def show
    @league = League.find(params[:id])
    @teams = @league.teams
  end

  def update
  end

  def destroy

  end

end
