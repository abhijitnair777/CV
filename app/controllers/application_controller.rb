class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :current_user
  helper_method :logged_in?
 

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate
    redirect_to login_sessions_path unless logged_in?
  end

  def logged_in?
    !current_user.nil?
  end
end
