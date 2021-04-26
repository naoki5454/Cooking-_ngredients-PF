class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).per(8)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admins_customer_path(@customer), notice: '更新しました'
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :k_name, :k_las, :email, :is_valid)
  end
end
