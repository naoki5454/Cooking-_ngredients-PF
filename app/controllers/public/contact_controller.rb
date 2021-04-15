class Public::ContactController < ApplicationController

  def new
    # 入力画面を表示
    @contact = Contact.new
  end

  def confirm
    # 入力値のチェック
    @contact = Contact.new(params[:inquiry])
    if @contact.valid?
      # OK。確認画面を表示
      render 'confirm'
    else
      # NG。入力画面を再表示
      render 'new'
    end
  end

  def thanks
    # メール送信
    @contact = Contact.new(params[:inquiry])
    InquiryMailer.received_email(@contact).deliver

    # 完了画面を表示
    render 'thanks'
  end
end
