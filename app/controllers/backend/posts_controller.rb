class Backend::PostsController < Backend::ApplicationController

  def index
    @posts = Post.post.includes(:comments, :categories, :user).page params[:page]
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params.merge(post_type: :post))
    if @post.save
      redirect_to posts_path, flash: { success: "新增成功" }
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, flash: { success: "修改成功" }
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.delete
    redirect_to posts_path, flash: { success: "刪除成功" }
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :status, :posted_at, category_ids: :[], tag_ids: :[])
  end

end
