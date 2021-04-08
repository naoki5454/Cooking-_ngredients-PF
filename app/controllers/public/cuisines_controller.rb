class Public::CuisinesController < ApplicationController

  def new
    @cuisine = Cuisine.new
  end

  def index
    case params[:list_dishes]
    when "0"
      @cuisines = Cuisine.page(params[:page]).per(8)
      @genres = Genre.all
    else
      @genre = Genre.find(params[:id])
      @cuisines = @genre.cuisine
    end
  end

  def show
    @cuisine = Cuisine.find(params[:id])
    @genres = Genre.all
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    @cuisine.customer_id = current_customer.id
    if @cuisine.save
      redirect_to cuisine_path(@cuisine)
    else
      render "new"
    end
  end

  private
  def cuisine_params
    params.require(:cuisine).permit(:customer_id, :cuisine_image_id, :genre_id, :cuisine_name, :introduction, :time)
  end

end
