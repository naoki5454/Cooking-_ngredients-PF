class Public::CustomersController < ApplicationController

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

  def customer_params
    params.require(:customer).permit(:nickname, :customer_image_id, :introduction)
  end

end
