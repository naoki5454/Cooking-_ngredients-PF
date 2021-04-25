class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: %i[show edit update withdraw]
  before_action :correct_customer, only: %i[edit update withdraw]

  def show
    @customer = Customer.find(params[:id])
    @cuisine = @customer.cuisines
    @cuisines = @cuisine.page(params[:page]).per(5)
    @genres = Genre.limit(13)
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
      flash[:notice] = '編集成功しました。'
    else
      render :edit
    end
  end

  def favorite
    @customer = current_customer
    @favorites = @customer.cuisine_favorites.page(params[:page]).per(5)
    @genres = Genre.limit(13)
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
    flash[:notice] = '退会しました'
  end

  def correct_customer
    @customer = Customer.find(params[:id])
    return if @customer.id == current_customer.id

    redirect_to root_path
    flash[:alert] = 'urlから直打ちしないでください。（他人のプロフィール編集ページです）'
  end

  def customer_params
    params.require(:customer).permit(:nickname, :customer_image, :introduction)
  end
end
