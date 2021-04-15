class Public::ContactController < ApplicationController

  def new
    # 入力画面を表示
    @contact = Contact.new
  end

  def confirm
    # 入力値のチェック
    contact = params.require(:contact).permit(:name, :email, :message)
    @contact = Contact.new(contact)
      #確認画面を表示
      render 'confirm'
  end

  def thanks
    # メール送信
    contact = params.require(:contact).permit(:name, :email, :message)
    @contact = Contact.new(contact)
    InquiryMailer.received_email(@contact).deliver

    # 完了画面を表示
    render 'thanks'
  end
end
