class Frontend::NewsController < Frontend::ApplicationController

  def index
    @recent_news = News.page params[:page]
  end

end
