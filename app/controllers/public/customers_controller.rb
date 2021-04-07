class Public::CustomersController < ApplicationController

  def new
  end

  def show
    @customer = Customer.find(params[:id])
    @cuisines = @customer.cuisines
  end
end
