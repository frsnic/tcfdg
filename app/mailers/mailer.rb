class Mailer < ApplicationMailer
  def contact(params)
    @params = params
    mail to: Settings.email.info, subject: "[#{Settings.name} Contact] #{@params['subject']}"
  end
end
