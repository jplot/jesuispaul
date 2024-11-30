class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name(ENV["MAILER_SENDER"], ENV["MAILER_SENDER_NAME"])
  layout "mailer"
end
