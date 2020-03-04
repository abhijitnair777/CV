class AchievementsController < ApplicationController
  def index
    @achievements = Achievement.all
  end

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      render :show
    else
      render json: @achievement.errors
    end
  end

  def destroy
    @achievement.destroy
    render :new
  end

  def show
     @achievement = Achievement.find(params[:id])
  end

  private
  
  def achievement_params
    params.require(:achievement).permit(:achievement_description, :resume_id)
  end   
end
