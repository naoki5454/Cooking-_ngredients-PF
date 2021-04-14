class Public::CuisinesController < ApplicationController

  def new
    @cuisine = Cuisine.new
  end

  def index
    @cuisines = Cuisine.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @cuisine = Cuisine.find(params[:id])
    @genres = Genre.all
    @cuisine_comments = CuisineComment.new
  end

  def favorite
    @cuisine = Cuisine.find(params[:cuisine_id])
    @favorites = @cuisine.cuisine_favorites
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

  def edit
    @cuisine = Cuisine.find(params[:id])
  end

  def update
    @cuisine = Cuisine.find(params[:id])
    if @cuisine.update(cuisine_params)
      redirect_to cuisine_path(@cuisine)
    else
      render "edit"
    end
  end

  private
  def cuisine_params
    params.require(:cuisine).permit(:customer_id, :cuisine_image_id, :genre_id, :cuisine_name, :introduction, :time)
  end

end
