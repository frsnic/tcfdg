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

  def delete
  end
end
