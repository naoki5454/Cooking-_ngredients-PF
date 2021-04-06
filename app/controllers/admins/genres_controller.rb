class Admins::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admins_genres_path
    else
      render admins_genres_path
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
