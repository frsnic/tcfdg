module FrontendHelper

  def post_year_month_list(length)
    Post.publish.select(:posted_at).
      group_by { |t| t.posted_at.beginning_of_month.to_time }.keys[0..length - 1].
      map { |t| t.to_s.split("-")[0..1] }
  end

  def content_area(post)
    link = link_to "Continue Reading...", frontend_post_path(post.id, post.handle), class: "margin-left-10"
    content_tag :p do
      "#{post.excerpt}#{link}".html_safe
    end
  end

  def gtag
    %Q(
      <!-- Global site tag (gtag.js) - Google Analytics -->
      <script async src="https://www.googletagmanager.com/gtag/js?id=UA-59284592-1"></script>
      <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-59284592-1');
      </script>
    )
  end

end
