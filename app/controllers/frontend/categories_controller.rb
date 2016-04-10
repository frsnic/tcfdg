class Frontend::CategoriesController < Frontend::ApplicationController

  def index
  end

  def show
    @category = Category.find_by_handle(params[:handle])
    @recent_posts = @category.posts.page params[:page]
  end

end
