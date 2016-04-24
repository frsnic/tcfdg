module Backend::DashboardHelper

  def nav_link(text, path, options = {})
    icon_tag = options[:icon] ? content_tag(:span, "", class: options[:icon]) : ""
    content_tag(:li, current_page?(path) ? { class: "active" } : {}) do
      link_to "#{text}#{icon_tag}".html_safe, path
    end
  end

end
