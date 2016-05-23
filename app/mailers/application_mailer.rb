class ApplicationMailer < ActionMailer::Base
  default from: Setting.email.noreply

end
