class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login, :admin_only
  include SessionsHelper

  def current_user
    if !session[:user_id].nil?
      User.find(session[:user_id])
    else
      return nil
    end
  end

  def require_login
    unless current_user
      redirect_to root_url
    end
  end

  def admin_only
    unless current_user.admin
      flash[:notice] = "You must be an admin to perform that function!"
      redirect_to user_path(current_user)
    else
      return true
    end
  end

end
