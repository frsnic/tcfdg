class Frontend::PostsController < Frontend::ApplicationController

  def show
    @post = Post.includes(:comments).post.find_by_handle params[:handle]
  end

  def preview
    @post = Post.includes(:comments).preview.find params[:id]
    render "/frontend/posts/show"
  end

end
