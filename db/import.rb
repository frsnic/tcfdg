WPDB::Post.find_each do |post|
  Post.create(
    id: post.id,
    author_id: post.post_author,
    category_id: post.menu_order,
    posted_at: post.post_date,
    content: content(post.post_content),
    title: post.post_title,
    excerpt: post.post_excerpt,
    status: post.post_status,
    comment_status: post.comment_status,
    ping_status: post.ping_status,
    password: post.post_password,
    handle: URI.unescape(post.post_name),
    post_type: post.post_type,
    mime_type: post.post_mime_type,
    comment_count: post.comment_count,
    created_at: post.post_modified,
    updated_at: post.post_modified
  )
end

WPDB::Term.find_each do |tag|
  Tag.create(
    id: tag.id,
    name: tag.name,
    created_at: Time.now,
    updated_at: Time.now
  )
end
# Tag.find(9).delete

WPDB::TermRelationship.find_each do |post_tag|
  PostTag.create(
    post_id: post_tag.object_id,
    tag_id: post_tag.term_taxonomy_id,
    created_at: Time.now,
    updated_at: Time.now
  )
end

WPDB::Comment.find_each do |comment|
  Comment.create(
    post_id: comment.comment_post_ID,
    name: comment.comment_author,
    email: comment.comment_author_email,
    url: comment.comment_author_url,
    ip: comment.comment_author_IP,
    content: CGI::unescapeHTML(comment.comment_content),
    approved: comment.comment_approved == "1" ? true : false,
    agent: comment.comment_agent,
    user_id: comment.user_id,
    created_at: comment.comment_date,
    updated_at: comment.comment_date
  )
end

WPDB::New.find_each do |new|
  News.create(
    title: new.title,
    link: new.link,
    posted_at: new.post_time,
    created_at: new.post_time,
    updated_at: new.post_time
  )
end

WPDB::Term.category.find_each do |category|
  Category.create(
    id: category.term_id,
    name: category.name,
    created_at: Time.now,
    updated_at: Time.now
  )
end
# Category.first.delete
# Category.find_by_name("城市議題").update(handle: "city-issue")
# Category.find_by_name("城市故事").update(handle: "city-story")
# Category.find_by_name("港台交流").update(handle: "hk-communicate")

WPDB::Post.find_each do |wp_post|
  post = Post.find_by_id(wp_post.id)
  if post && post.post? && post.publish?
    wp_post.categories.each do |category|
      post.categories << Category.find(category.term_id)
    end
  end
end

WPDB::Activity.find_each do |activity|
  Activity.create(
    id: activity.id,
    name: activity.name,
    location: activity.location,
    link: activity.link,
    is_public: activity.is_public,
    start_at: activity.start_at,
    created_at: activity.created_at,
    updated_at: activity.updated_at
  )
end
#Activity.first.update(is_public: true)

WPDB::User.find_each do |user|
  User.create(
    id: user.id,
    name: user.display_name,
    identify: user.user_login,
    password: SecureRandom.hex(6),
    email: user.user_email,
    created_at: user.user_registered,
    updated_at: user.user_registered
  )
end
