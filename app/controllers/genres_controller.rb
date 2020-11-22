class GenresController < ApplicationController
  def index
    @genres = genres
  end

  def show
    genre = genres[params[:name].to_sym]
    @projects = Project.where(genre: genre)
  end
end
