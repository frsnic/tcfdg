class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  private

  def check_grecaptcha
    return Recaptcha.check_recaptcha(params['g-recaptcha-response'])
  end

end
