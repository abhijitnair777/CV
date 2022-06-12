class ProjectsController < ApplicationController
  def index
    @projects = Project.all.long_title
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render :show
    else
      render json: @project.errors
    end
  end
  
  def show
    @project = Project.find(params[:id])   
  end
  
  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.js { }
      format.html { redirect_to project_path(current_user) }
    end
  end

  private
  
  def project_params
    params.require(:project).permit(:project_name, :description, :url, :user_id)
  end	
end
