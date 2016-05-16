module ApplicationHelper

  def comment_path(comment)
    "/#{comment.post.id}/#{comment.post.handle}#comment-#{comment.id}"
  end

  def recaptcha
    content_tag(:div, "", data: { sitekey: Setting.recaptcha.public_key }, class: "g-recaptcha")
  end

end
