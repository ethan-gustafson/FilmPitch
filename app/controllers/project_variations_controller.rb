class ProjectVariationsController < ApplicationController

  def search

  end

  def new_projects
    @projects = Project.newly_created.last(10)
  end

  def popular_projects
    @projects = Project.most_popular.last(10)
  end

  def fully_funded
    @projects = Project.fully_funded.last(10)
  end

  def film_types
    @types = Project.film_types
  end

  def film_type
    type = Project.film_types[params[:type].to_sym]

    @projects = Project.find_projects_by_attr(key: :film_type, value: type).last(10)
  end
  
end
