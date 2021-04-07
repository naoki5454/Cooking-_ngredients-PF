class Admins::CuisinesController < ApplicationController

  def index
    @cuisines = Cuisine.page(params[:page]).per(8)
  end

  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def destroy
    @cuisine = Cuisine.find(params[:id])
  end
end
