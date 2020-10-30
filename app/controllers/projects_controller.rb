class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.includes(:user).last(10)
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)

    if @project.valid?
      @project.save
      redirect_to project_path(@project)
    else
      redirect_to new_project_path
    end
  end

  def show
    find_project_by_id
    show_comments?
  end

  def edit
    find_project_by_id
  end

  def update
    find_project_by_id
    current_user_project?

    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      redirect_to project_path(@project)
    end
  end

  def destroy
    find_project_by_id
    @project.destroy

    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(
      :name,
      :description,
      :goal,
      :film_type,
      :genre,
      :story_structure,
      :themes,
      :link,
      :user_id,
      :cover_image,
      :script
    )
  end
end