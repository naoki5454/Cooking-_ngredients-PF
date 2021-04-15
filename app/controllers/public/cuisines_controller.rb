class Public::CuisinesController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :favorite, :create, :edit, :update]
  before_action :correct_cuisine, only: [:edit]

  def search
    redirect_to root_path if params[:word] == "" # キーワードが入力されていないとトップページに飛ぶ
    redirect_to root_path if params[:range] == ""
    @range = params[:range]
		@search = params[:search]
		@word = params[:word]
		if @range == '1'
			@cuisine = Cuisine.search(@search,@word)
		elsif @range == '2'
			@genres = Genre.search(@search,@word)
		end
  end

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

  def favorite #料理へのいいね一覧
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

  def correct_cuisine
    @cuisine = Cuisine.find(params[:id])
    unless @cuisine.customer.id == current_customer.id
      redirect_to root_path
    end
  end

  private
  def cuisine_params
    params.require(:cuisine).permit(:customer_id, :cuisine_image_id, :genre_id, :cuisine_name, :material_introduction, :introduction, :time)
  end

end
