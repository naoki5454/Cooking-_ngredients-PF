class Admins::ContactsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @contacts = Contact.page(params[:page]).per(8)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to admins_contacts_path, notice: "更新しました"
    else
      render 'index', alert: '失敗しました'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:is_valid)
  end
end
