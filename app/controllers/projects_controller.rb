class ProjectsController < ApplicationController
  before_action :authenticate_user!

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
    
    @comments = @project.comments.joins(
      :user
    ).select(
      "comments.id, 
      comments.description, 
      comments.user_id, 
      users.first_name || ' ' || users.last_name 
      AS display_name"
    ).last(10).reverse.as_json
  end

  def index
    @projects = Project.take(10)
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

  def search

  end

  def new_projects
    # @projects = Project.newly_created
  end

  def popular_projects
    @projects = Project.most_popular
  end

  def fully_funded
    @projects = Project.fully_funded
  end

  def film_types
    @types = Project.film_types
  end

  def film_type
    type = Project.film_types[params[:type].to_sym]

    @projects = Project.find_projects_by_attr(key: :film_type, value: type)
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
      :user_id
    )
  end

  def find_project_by_id
    @project = Project.find_by_id(params[:id])
  end
end