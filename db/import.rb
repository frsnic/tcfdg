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
