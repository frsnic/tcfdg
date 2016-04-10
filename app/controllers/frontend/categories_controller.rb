class Frontend::CategoriesController < Frontend::ApplicationController

  def index
    @categories = Category.includes(:posts)
  end

  def show
    @category = Category.find_by_handle(params[:handle])
    @recent_posts = @category.posts.page params[:page]
  end

end
