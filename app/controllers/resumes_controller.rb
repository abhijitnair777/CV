class ResumesController < ApplicationController
  def index
    @resumes = Resume.all  
  end

  def new
    @resume = Resume.new
    @resume.skills.build
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to users_path
    else
      render json: @resume.errors
    end
  end

  def show
    @resume = Resume.find(params[:id])
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to view_user_resumes_resume_path
  end

  private
  
  def resume_params
    params.require(:resume).permit(:objective, :user_id, skills_attributes: [:id, :skill_name, :skill_description, :_destroy])
  end
end
