class Frontend::NewsController < Frontend::ApplicationController

  def index
    @news = News.page params[:page]
  end

end
