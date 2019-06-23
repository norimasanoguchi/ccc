class Users::Mailer < Devise::Mailer
  def confirmation_instructions(record, token, opts={})
    mail = super
    mail.subject = "【CCC】登録確認メール"
    mail
  end

end