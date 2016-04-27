module Backend::DashboardHelper

  def nav_link(text, path, options = {})
    icon_tag = options[:icon] ? content_tag(:span, "", class: options[:icon]) : ""
    active_icon = content_tag(:span, "", class: "glyphicon glyphicon-ok pull-right")
    text = current_page?(path) ? "#{icon_tag}#{text}#{active_icon}" : "#{icon_tag}#{text}"
    link_to text.html_safe, path, data: options[:data], class: (current_page?(path) ? "text-success" : "")
  end

end
