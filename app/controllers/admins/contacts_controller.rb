class Admins::ContactsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
<<<<<<< HEAD:app/controllers/admins/contacts_controller.rb
      redirect_to admins_contacts_path, notice: "更新しました"
=======
      redirect_to admins_contact_index_path, notice: '更新しました'
>>>>>>> 90158f731c311f0974e31b0c627c1b812d467e92:app/controllers/admins/contact_controller.rb
    else
      render 'index', alert: '失敗しました'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:is_valid)
  end
end
