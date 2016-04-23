class Frontend::CommentsController < Frontend::ApplicationController

  def create
    errors = %w(驗證碼錯誤) unless check_grecaptcha(params['g-recaptcha-response'])

    @post = Post.find params[:post_id]
    @comment = @post.comments.build(comment_params)
    if errors.blank? && @comment.save
      render json: { url: post_path(@post.id, @post.handle) + "#comment-#{@comment.id}" }
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
