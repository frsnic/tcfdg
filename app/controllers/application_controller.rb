class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def check_grecaptcha(response)
    return false if params['g-recaptcha-response'].blank?

    uri = URI("https://www.google.com/recaptcha/api/siteverify")
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    request = Net::HTTP::Post.new(uri.path)
    request.set_form_data(secret: Setting.recaptcha.secret_key, response: response)
    response = https.request(request)
    return JSON.parse(response.body)["success"] == true
  end

end
