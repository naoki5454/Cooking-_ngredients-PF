class Admins::CuisinesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @cuisines = Cuisine.page(params[:page]).per(8)
  end

  def show
    @cuisine = Cuisine.find(params[:id])
    @genres = Genre.all
  end

  def destroy
    @cuisine = Cuisine.find(params[:id])
    @cuisine.destroy
    redirect_to admins_cuisines_path
  end
end
