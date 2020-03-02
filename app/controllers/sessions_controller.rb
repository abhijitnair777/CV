class SessionsController < ApplicationController
  skip_before_action :authenticate, only: %i[new create]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate?(params[:password_enc])
      session[:user_id] = user.id
      redirect_to resumes_path
    else
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end	
end
