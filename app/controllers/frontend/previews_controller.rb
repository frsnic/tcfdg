class Frontend::PreviewsController < Frontend::ApplicationController

  def show
    @post = Preview.find_by_token params[:token]
  end

end
