class ContactMailer < ApplicationMailer
  default from: "mo@mo.com"   # 送信元アドレス
  default to: "mo@mo.com"     # 送信先アドレス

  def received_email(contact)
    @contact = contact
    mail(:subject => 'お問い合わせを承りました')
  end
end
