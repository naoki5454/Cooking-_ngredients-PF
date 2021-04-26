class Public::ContactsController < ApplicationController
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
<<<<<<< HEAD:app/controllers/public/contacts_controller.rb
      redirect_to contacts_thanks_path, notice: "送信完了しました。"
=======
      redirect_to contacts_thanks_path
      flash[:notice] = '送信完了しました。'
>>>>>>> 90158f731c311f0974e31b0c627c1b812d467e92:app/controllers/public/contact_controller.rb
    else
      render 'new'
    end
  end

  def thank; end

  private

  def contact_params
    params.require(:contact).permit(:name, :message, :customer_id)
  end
end
