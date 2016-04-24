class Backend::PostsController < Backend::ApplicationController

  def index
    @posts = Post.post.page params[:page]
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find params[:id]
    @post.delete
    redirect_to posts_path, flash: { success: "刪除成功" }
  end

end
