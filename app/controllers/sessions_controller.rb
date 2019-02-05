class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  # def create
  #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
  #     u.name = auth['info']['name']
  #     u.email = auth['info']['email']
  #   end
  #
  #   binding.pry
  #   session[:user_id] = @user.id
  #
  #   redirect_to @user
  # end

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

  def googleAuth
    # Get access tokens from the google server
    auth = request.env['omniauth.auth']
    raise auth.inspect
  end

end #end of controller
