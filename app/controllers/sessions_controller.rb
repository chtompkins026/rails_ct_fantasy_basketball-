class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      redirect_to @user
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    if logged_in?
      session.delete(:user_id)
      redirect_to root_path
    end
  end

  private

  # def hitmebaby(user, info)
  #   if (flash[:error] = User.auth_error(user, info))
  #     redirect_to login_path
  #   else
  #     login(user)
  #   end
  # end

end #end of controller
