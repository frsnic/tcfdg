class Backend::TagsController < Backend::ApplicationController

  def index
    @tags = Tag.page params[:page]
    @tag  = Tag.new
  end

  def show
    @recent_posts = @tag.posts.page params[:page]
  end

  def new
  end

  def create
    if @tag = Tag.find_or_create_by(tag_params)
      respond_to do |format|
        format.html { redirect_to tags_path, flash: { success: "新增成功" } }
        format.json { render :json => @tag }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update tag_params
      redirect_to tags_path, flash: { success: "修改成功" }
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, flash: { success: "刪除成功" }
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
