class EducationsController < ApplicationController
  def new
    @education = Education.new
  end

  def create
    @education = Education.new(education_params)
    if @education.save
      render :show
    else
      render :new
    end
  end

  private
  
  def education_params
    params.require(:education).permit(:institute_name, 
    :year_of_passing, :percentage, :qualification_id)
  end   
end
