class Public::CuisinesController < ApplicationController

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    #if
    @cuisine.save
      redirect_to cuisines_path
    #else
      #render "new"
    #end
  end

  private
  def cuisine_params
    params.require(:cuisine).permit(:cuisine_image_id, :genre_id, :cuisine_name, :introduction, :time)
  end

end
