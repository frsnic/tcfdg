class Frontend::SearchController < Frontend::ApplicationController
  before_action :validate

  def index
    @posts = Post.publish.search(@query).result(:distinct => true).page params[:page]
  end

  protected

  def validate
    query_string = params[:q].present? ? params[:q].gsub(/\\|\'|\/|\?/, "") : ""
    @query = { title_or_content_cont: query_string }
  end

end
