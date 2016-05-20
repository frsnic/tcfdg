class Frontend::TagsController < Frontend::ApplicationController

  def index
    @tags = Tag.includes(:posts).publish_post.page params[:page]
  end

  def show
    @tag = Tag.find_by_name params[:name]
    redirect_to root_path, :flash => { error: "目錄已移除" } and return unless @tag
    @recent_posts = @tag.posts.publish.page params[:page]
  end

end
