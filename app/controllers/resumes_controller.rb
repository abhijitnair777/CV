class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
    @resume.skills.build
    @resume.achievements.build
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      render :show
    else
      render json: @resume.errors
    end
  end

  def show
    @resume = Resume.find(params[:id])
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update_attributes(resume_params)
      redirect_to resume_path
    else
      render :edit
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    respond_to do |format|
      format.js { }
      format.html { redirect_to view_user_resumes_resume_path }
    end
  end

  private
  
  def resume_params
    params.require(:resume).permit(:objective, :user_id, 
    skills_attributes: [:id, :skill_name, :skill_description, 
    :_destroy], achievements_attributes: [:id, :achievement_description, 
    :_destroy])
  end
end
