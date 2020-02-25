class SkillsController < ApplicationController
  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      render :show
    else
      render :new
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
    params.require(:skill).permit(:skill_name, :skill_description)
  end	
end
