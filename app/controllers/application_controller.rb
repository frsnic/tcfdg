class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  # def check_grecaptcha
  #   Recaptcha.check_recaptcha(params['g-recaptcha-response'])
  # end
end
