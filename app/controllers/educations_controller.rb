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
      flash[:success] = "Education details has been added"
    else
      flash[:success] = "Education detail already exist or unable to save"
      render :new
    end
  end

  def edit
    @education = Education.find_by_user_id(params[:id])
  end

  def update
    @education = Education.find_by_user_id(params[:id])
    if @education.update_attributes(education_params)
      flash[:success] = "Education details has been updated"      
      redirect_to education_path
    else
      render :edit
    end
  end

  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    respond_to do |format|
      format.js { }
      format.html { redirect_to education_path(current_user) }
    end
  end

  private
  
  def education_params
    params.require(:education).permit(:institute_name, 
    :year_of_passing, :percentage, :user_id, :qualification_id)
  end
end
