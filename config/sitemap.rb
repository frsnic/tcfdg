SitemapGenerator::Interpreter.include FrontendHelper

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = Settings.url

SitemapGenerator::Sitemap.create do
  add '/about_us',   changefreq: 'never'
  add '/contact_us', changefreq: 'never'

  post_times = post_year_month_list(10)
  post_times.each do |post_time|
    add "/date/#{post_time[0]}/#{post_time[1]}", changefreq: 'monthly'
  end

  add '/categories', changefreq: 'monthly'
  Category.find_each do |category|
    add frontend_category_path(category.handle), changefreq: 'daily'
  end

  add '/tags', changefreq: 'weekly'
  Tag.find_each do |tag|
    add frontend_tag_path(tag.name), changefreq: 'weekly'
  end

  Post.publish.find_each do |post|
    add frontend_post_path(post.id, post.handle), changefreq: 'daily'
  end

  add '/activities', changefreq: 'weekly'
  Activity.is_public.each do |activity|
    add frontend_activity_path(activity), changefreq: 'weekly'
  end

  add '/news', changefreq: 'monthly'
end
