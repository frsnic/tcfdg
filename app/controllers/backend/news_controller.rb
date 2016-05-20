class Backend::NewsController < Backend::ApplicationController

  def index
    @newses = News.page params[:page]
  end

  def new
  end

  def create
    if @news = News.create(news_params)
      redirect_to news_index_path, flash: { success: "新增成功" }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @news.update news_params
      redirect_to news_index_path, flash: { success: "修改成功" }
    else
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to news_index_path, flash: { success: "刪除成功" }
  end

  private

  def news_params
    params.require(:news).permit(:title, :posted_at, :link)
  end

end
