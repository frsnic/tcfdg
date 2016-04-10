class Frontend::WebsController < Frontend::ApplicationController

  def index
  end

  def about_us
  end

  def contact_us
  end

  def send_email
    Mailer.contact(params).deliver_later
    redirect_to contact_us_path, success: "發送成功" and return
  end

end
