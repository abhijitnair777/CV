class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render :show
    else
      render :new
    end
  end
  
  def show   
    @project = Project.find(params[:id])   
  end   
  
  def edit
    @project = Project.find(params[:id])
  end

  def update
    @user = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to users_path
  end

  private
  
  def project_params
    params.require(:project).permit(:project_name, :description, :url)
  end	
end
