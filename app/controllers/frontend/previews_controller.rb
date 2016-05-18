class Frontend::PreviewsController < Frontend::ApplicationController

  def show
    @post = Preview.find_by_token params[:token]
    redirect_to root_path, :flash => { error: "目錄已移除" } and return unless @post
  end

end
