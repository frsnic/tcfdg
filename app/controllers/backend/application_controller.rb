class Backend::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :prepare_meta_tags, if: "request.get?"
  layout "backend_application"

  def prepare_meta_tags(options = {})
    hash = {
      site: Setting.name,
      noindex: true,
      nofollow: true,
      icon: [
        { href: '/favicon.ico' },
        { href: '/apple-touch-icon.png', rel: 'apple-touch-icon', type: 'image/png' },
      ],
    }

    set_meta_tags hash
  end

end
