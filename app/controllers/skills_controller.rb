class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end
  
  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      render :show
    else
      render json: @skill.errors
    end
  end

  def destroy
    @skill.destroy
    render :new
  end

  def show
     @skill = Skill.find(params[:id])
  end

  private
  
  def skill_params
    params.require(:skill).permit(:skill_name, :skill_description, :resume_id)
  end	
end
