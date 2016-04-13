module ApplicationHelper

  def comment_path(comment)
    "/#{comment.post.id}/#{comment.post.handle}#comment-#{comment.id}"
  end

  def title(page_title = nil)
    content_for :title, page_title
  end

end
