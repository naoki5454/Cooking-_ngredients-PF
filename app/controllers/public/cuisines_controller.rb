class Public::CuisinesController < ApplicationController
  before_action :authenticate_customer!, only: %i[new favorite create edit update]
  before_action :correct_cuisine, only: [:edit]

  def search
    # flash[:alert] = "空欄で検索しないでください。"
    # redirect_to root_path if params[:range] == "" #rangeが入力されていないとトップページに飛ぶ
    @range = params[:range]
		@search = params[:search]
		@word = params[:word]
		if @range == ''
		  redirect_to root_path
		  flash[:alert] = "空欄があります"
		elsif  @range == '1'
			@cuisine = Cuisine.search(@search,@word)
		elsif @range == '2'
			@genres = Genre.search(@search,@word)
		end
  end

  def new
    @cuisine = Cuisine.new
  end

  def index
    case params[:order_sort]
    when "0"
      @cuisines = Cuisine.joins(:cuisine_favorites).group(:cuisine_id).order('count(cuisine_id) desc').page(params[:page]).per(6)
      @genres = Genre.limit(12)
    else
      @cuisines = Cuisine.page(params[:page]).per(6)
      @genres = Genre.limit(12)
    end
  end

  def show
    @comment = CuisineComment.new
    @cuisine = Cuisine.find(params[:id])
    @genres = Genre.limit(13)
  end

  # 料理へのいいね一覧
  def favorite
    @cuisine = Cuisine.find(params[:cuisine_id])
    @favorites = @cuisine.cuisine_favorites
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    @cuisine.customer_id = current_customer.id
    if @cuisine.save
      redirect_to cuisine_path(@cuisine), notice: "投稿成功しました。"
    else
      render 'new'
    end
  end

  def edit
    @cuisine = Cuisine.find(params[:id])
  end

  def update
    @cuisine = Cuisine.find(params[:id])
    if @cuisine.update(cuisine_params)
      redirect_to cuisine_path(@cuisine)
      flash[:notice] = '編集成功しました。'
    else
      render 'edit'
    end
  end

  def destroy
    @customer = current_customer
    @cuisine = Cuisine.find(params[:id])
    @cuisine.destroy
    redirect_to customer_path(@customer)
  end

  def correct_cuisine
    @cuisine = Cuisine.find(params[:id])
    return if @cuisine.customer.id == current_customer.id

    redirect_to root_path
    flash[:alert] = 'urlから直打ちしないでください。（他人の料理編集ページです）'
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:customer_id, :genre_id, :cuisine_image, :cuisine_name, :material_introduction,
                                    :introduction, :time)
  end
end
