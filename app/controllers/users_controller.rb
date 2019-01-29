class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name= params[:user][:name]
    @user.password = params[:user][:password]
    @user.email = params[:user][:email]

    if params[:user][:admin].to_i == 1
      @user.admin = true
    else
      @user.admin = false
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render '/users/new'
    end
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
  end

  def update
    user = User.find(params[:id])
    user.update(name: params[:name], password: params[:password], params[:email])
    user.save
  end


private

  def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :name,
        :password,
        :email,
        :admin
      )
    end

end
