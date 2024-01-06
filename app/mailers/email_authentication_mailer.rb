class EmailAuthenticationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email_authentication_mailer.send_when_signup.subject
  #
  def send_when_signup(user)
    @user = user
    @token = user.confirmation_token
    mail(
      to: user.email,
      subject: I18n.t('email_subjects.account_confirmation'),
      bcc: 'buzzbase.app@gmail.com'
    )
    mail to: user.email, subject: I18n.t('email_authentication_mailer.signup_subject')
  end
end
