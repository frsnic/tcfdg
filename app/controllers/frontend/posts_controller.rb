class Frontend::PostsController < Frontend::ApplicationController

  def show
    @post = Post.includes(:comments, :post_meta).post.publish.find_by_handle params[:handle]
    prepare_meta_tags title: @post.title,
                      description: @post.post_meta.description || @post.excerpt,
                      keywords: @post.post_meta.keywords,
                      og_type: 'article',
                      image: @post.main_picture_url
  end

end
