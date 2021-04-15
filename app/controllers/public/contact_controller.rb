class Public::ContactController < ApplicationController
  before_action :authenticate_customer!

  def new
    @contact = Contact.new
  end

  def confirm
    # 入力値のチェック
    contact = params.require(:contact).permit(:name, :message)
    @contact = Contact.new(contact)
      #確認画面を表示
      render 'confirm'
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id
    @contact.save
    redirect_to contact_thanks_path
  end

  def thank
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :message, :customer_id)
  end
end
