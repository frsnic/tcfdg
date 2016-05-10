class Backend::CategoriesController < Backend::ApplicationController

  def index
    @categories = Category.page params[:page]
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @recent_posts = @category.posts.page params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.html { redirect_to categories_path, flash: { success: "新增成功" } }
        format.json { render :json => @category }
      end
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, flash: { success: "修改成功" }
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to categories_path, flash: { success: "刪除成功" }
  end

  private

  def category_params
    params.require(:category).permit(:name, :handle)
  end

end
