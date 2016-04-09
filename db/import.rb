# WPDB::Post.first.as_json.keys.map { |k| k.downcase }
WPDB::Post.find_each do |post|
  Post.create(
    id: post.id,
    author_id: post.post_author,
    category_id: post.menu_order,
    posted_at: post.post_date,
    content: post.post_content,
    title: post.post_title,
    excerpt: post.post_excerpt,
    status: post.post_status,
    comment_status: post.comment_status,
    ping_status: post.ping_status,
    password: post.post_password,
    handle: post.post_name,
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
    content: comment.comment_content,
    approved: comment.comment_approved == "1" ? true : false,
    agent: comment.comment_agent,
    user_id: comment.user_id,
    created_at: comment.comment_date,
    updated_at: comment.comment_date
  )
end

