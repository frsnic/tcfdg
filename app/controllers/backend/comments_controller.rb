class Backend::CommentsController < Backend::ApplicationController

  def index
    @comments = Comment.page params[:page]
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]
    if @comment.update comment_params
      redirect_to comments_path, flash: { success: "修改成功" }
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to comments_path, flash: { success: "刪除成功" }
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :content, :url)
  end

end
