class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_creation_params)

    if @project.valid?
      @project.save
      redirect_to project_path(@project)
    else
      redirect_to new_project_path
    end
  end

  def show
    find_project_by_id
  end

  def index
    @projects = Project.take(3)
  end

  def edit
    find_project_by_id
  end

  def update

  end

  def destroy
    
  end

  private

  def project_creation_params
    params.require(:project).permit(
      :name,
      :description,
      :goal,
      :film_type,
      :genre,
      :story_structure,
      :themes,
      :link,
      :user_id
    )
  end

  def project_update_params
    params.require(:project).permit(
      :description,
      :film_type,
      :genre,
      :story_structure,
      :themes,
      :link
    )
  end

  def find_project_by_id
    @project = Project.find_by_id(params[:id])
  end
end
