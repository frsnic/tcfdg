module FrontendHelper

  def post_year_month_list(length)
    Post.post.publish.select(:posted_at).
      group_by { |t| t.posted_at.beginning_of_month.to_time }.keys[0..length - 1].
      map { |t| t.to_s.split("-")[0..1] }
  end

  def content_area(post)
    link = link_to "Continue Reading...", frontend_post_path(post.id, post.handle), class: "margin-left-10"
    content_tag :p do
      "#{post.excerpt}#{link}".html_safe
    end
  end

  def google_tag_manager
    %Q(
      <!-- Google Tag Manager -->
      <noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TGKC96"
      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
      <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
      new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
      j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
      '//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
      })(window,document,'script','dataLayer','GTM-TGKC96');</script>
      <!-- End Google Tag Manager -->
    )
  end

end
