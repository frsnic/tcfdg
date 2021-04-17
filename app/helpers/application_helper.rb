module ApplicationHelper
  def frontend_comment_path(comment)
    "/#{comment.post.id}/#{comment.post.handle}#comment-#{comment.id}"
  end

  def recaptcha
    content_tag(:div, '', data: { sitekey: Settings.recaptcha.public_key }, class: 'g-recaptcha')
  end
end
