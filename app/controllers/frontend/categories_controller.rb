class Frontend::CategoriesController < Frontend::ApplicationController

  def index
    @categories = Category.includes(:posts).publish_post.page params[:page]
  end

  def show
    @category = Category.find_by_handle params[:handle]
    @recent_posts = @category.posts.publish.page params[:page]
  end

end
