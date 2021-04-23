class Public::ContactController < ApplicationController
  before_action :authenticate_customer!

  def new
    @contact = Contact.new
  end

  def index
    @customer = current_customer
    @contacts = @customer.contact
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def confirm
    # 入力値のチェック
    contact = params.require(:contact).permit(:name, :message)
    @contact = Contact.new(contact)
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id
    if @contact.save
      redirect_to contact_thanks_path
      flash[:notice] = "送信完了しました。"
    else
      render 'new'
    end
  end

  def thank
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :message, :customer_id)
  end
end
