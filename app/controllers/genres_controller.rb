class GenresController < ApplicationController

  def index
    @genres = Project.genres
  end

  def show
    genre = Project.genres[params[:name].to_sym]

    @projects = Project.where(genre: genre)
  end
end
