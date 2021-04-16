class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:edit, :update, :withdraw]
  before_action :correct_cuisine, only: [:edit, :update, :withdraw]

  def show
    @customer = Customer.find(params[:id])
    @cuisines = @customer.cuisines
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  def correct_cuisine
    @cuisine = Cuisine.find(params[:id])
    unless @cuisine.customer.id == current_customer.id
      redirect_to root_path
    end
  end

  def customer_params
    params.require(:customer).permit(:nickname, :customer_image_id, :introduction)
  end

end
