class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @cuisines = @customer.cuisines
  end

end
