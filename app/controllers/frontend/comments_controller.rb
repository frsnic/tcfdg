class Frontend::CommentsController < Frontend::ApplicationController

  def create
    errors = %w(驗證碼錯誤) unless check_grecaptcha

    @post = Post.find params[:post_id].to_i
    @comment = @post.comments.build comment_params
    if errors.blank? && @comment.save
      render json: { url: frontend_post_path(@post.id, @post.handle) + "#comment-#{@comment.id}" }
    else
      errors ||= []
      errors += @comment.errors.full_messages
      render json: { message: errors }, status: 404
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :url, :content)
  end

end
