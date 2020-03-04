class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.password!(user_password[:password])
      session[:user_id] = @user.id
      redirect_to resumes_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to resumes_path
    else
      render :edit
    end
  end

  def show
  end  

  private

  def user_params
    params.require(:user).permit(:name, :email,
    :contact, :city, :address, :dob)
  end

  def user_password
    params.require(:user).permit(:password)
  end
end
