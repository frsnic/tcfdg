module BackendHelper

  def nav_link(text, path, options = {})
    icon_tag = options[:icon] ? content_tag(:span, "", class: options[:icon]) : ""
    active_icon = content_tag(:span, "", class: "glyphicon glyphicon-ok pull-right")
    is_active = is_list_active?(path)
    text = is_active ? "#{icon_tag}#{text}#{active_icon}" : "#{icon_tag}#{text}"
    link_to text.html_safe, path, data: options[:data], class: (is_active ? "text-success" : "")
  end

  def is_list_active?(path)
    current_page?(path) || is_action_match?(path)
  end

  def is_action_match?(path)
    params = Rails.application.routes.recognize_path(request.url)
    path   = Rails.application.routes.recognize_path(path)
    return false if params[:controller] != path[:controller]

    case path[:controller]
    when 'backend/posts'
      case path[:action]
      when 'index'
        %w(index show edit).include? params[:action]
      when 'new'
        %w(new).include? params[:action]
      else
        false
      end
    else
      params[:controller] == path[:controller]
    end
  end

end
