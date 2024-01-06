class ApplicationMailer < ActionMailer::Base
  default from: 'buzzbase運営',
          bcc: 'buzzbase.app@gmail.com'
  layout 'mailer'

  def custom_confirmation_url(_resource, token)
    "#{ENV.fetch('CONFIRM_SUCCESS_URL', nil)}?confirmation_token=#{token}"
  end
end
