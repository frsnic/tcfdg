class Frontend::PostsController < Frontend::ApplicationController

  def show
    @post = Post.includes(:comments).find_by_handle(params[:handle])
  end

end