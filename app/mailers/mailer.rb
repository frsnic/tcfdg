class Mailer < ApplicationMailer

  def contact(params)
    @params = params
    mail to: "frsnic@gmail.com", from: @params[:email], subject: "[Contact] #{@params[:subject]}"
  end

end
