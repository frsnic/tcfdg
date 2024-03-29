class Backend::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :prepare_meta_tags, if: 'request.get?'

  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to dashboard_path, flash: { warning: exception.message }
  end

  layout 'backend_application'

  protected

  def configure_permitted_parameters
    added_attrs = %i[identify password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def prepare_meta_tags(_options = {})
    hash = {
      site: Settings.name,
      noindex: true,
      nofollow: true,
      icon: [
        { href: '/images/favicon.ico' },
        { href: '/images/apple-touch-icon.png', rel: 'apple-touch-icon', type: 'image/png' }
      ]
    }

    set_meta_tags hash
  end
end
