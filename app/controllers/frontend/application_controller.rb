class Frontend::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :prepare_meta_tags, if: "request.get?"
  layout "frontend_application"

  def prepare_meta_tags(options = {})
    site_name   = Setting.name
    title       = options[:title]
    description = options[:description] || Setting.description
    keywords    = "#{options[:keywords]}, #{Setting.keywords}".strip.split(/, */).reject { |e| e.empty? }
    image       = options[:image].present? ? "#{Setting.url}#{options[:image]}" : "#{Setting.url}#{ActionController::Base.helpers.asset_path('logo_text.gif')}"
    current_url = request.url

    hash = {
      site: site_name,
      title: title,
      image: image,
      description: description,
      keywords: keywords,
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: options[:og_type] || 'website'
      },
      icon: [
        { href: '/favicon.ico' },
        { href: '/apple-touch-icon.png', rel: 'apple-touch-icon', type: 'image/png' },
      ],
      alternate: [
        { href: Setting.rss, type: 'application/rss+xml', title: 'RSS' },
      ]
    }

    set_meta_tags hash
  end

end
