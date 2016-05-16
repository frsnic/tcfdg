class Backend::PreviewsController < Backend::ApplicationController

  def create
    @preview = current_user.previews.create preview_params
    render json: @preview
  end

  private

  def preview_params
    params.require(:post).permit(:title, :content, :posted_at)
  end

end
