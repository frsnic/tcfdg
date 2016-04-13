class Frontend::CommentsController < Frontend::ApplicationController

  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.create comment_params
    redirect_to post_path(@post, @post) + "#comment-#{@comment.id}" and return
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :url, :content)
  end

end
