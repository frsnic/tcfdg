class Frontend::TagsController < Frontend::ApplicationController

  def index
    @tags = Tag.includes(:posts).page params[:page]
  end

  def show
    @tag = Tag.includes(:posts).find_by_name(params[:name])
    @recent_posts = @tag.posts.page params[:page]
  end

end
