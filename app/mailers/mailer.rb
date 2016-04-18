class Mailer < ApplicationMailer

  def contact(params)
    @params = params
    mail to: Setting.email.info, subject: "[#{Setting.name} Contact] #{@params['subject']}"
  end

end
