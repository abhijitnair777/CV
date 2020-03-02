class EducationsController < ApplicationController
  def index
    @educations = Education.all
  end

  def new
    @education = Education.new
  end

  def create
    @education = Education.new(education_params)
    if @education.save
      render :show
    else
      render json: @education.errors
    end
  end

  def edit
    @education = Education.find(params[:id])
  end

  def update
    @education = Education.find(params[:id])
    if @education.update_attributes(education_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private
  
  def education_params
    params.require(:education).permit(:institute_name, 
    :year_of_passing, :percentage, :qualification_id, :user_id)
  end
end
