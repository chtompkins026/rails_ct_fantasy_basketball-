class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      flash[:error] = "#{@user.errors.full_messages.join(". ")}"
      render 'new'
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
    @user.update(name: params[:name], password: params[:password], email: params[:email])
    @user.save
  end

  def destroy
    session[:user_id] = nil
    @user.destroy
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
