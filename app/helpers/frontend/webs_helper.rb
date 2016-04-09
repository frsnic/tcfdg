module Frontend::WebsHelper

  def post_year_month_list(length)
    Post.post.publish.select(:posted_at).
      group_by { |t| t.posted_at.beginning_of_month.to_time }.keys[0..length - 1].
      map { |t| t.to_s.split("-")[0..1] }
  end

end
