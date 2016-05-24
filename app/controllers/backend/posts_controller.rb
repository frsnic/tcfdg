class Backend::PostsController < Backend::ApplicationController

  def index
    @posts = Post.includes(:categories, :user).page params[:page]
  end

  def new
    @post = current_user.posts.new
    @post.build_post_meta
  end

  def create
    @post = current_user.posts.new post_params

    if @post.save
      redirect_to posts_path, flash: { success: "新增成功" }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to posts_path, flash: { success: "修改成功" }
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, flash: { success: "刪除成功" }
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :excerpt, :handle, :status, :posted_at, category_ids: [], tag_ids: [],
                                 post_meta_attributes: [:keywords, :description])
  end

end
