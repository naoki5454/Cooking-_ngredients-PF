class Public::GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @cuisines = @genre.cuisines.page(params[:page]).per(8)
  end

  def index
    @genres = Genre.all
  end
end
