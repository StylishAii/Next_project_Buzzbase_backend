class ApplicationMailer < ActionMailer::Base
  default from: 'buzzbase運営',
          bcc: 'buzzbase.app@gmail.com'
  layout 'mailer'
end
