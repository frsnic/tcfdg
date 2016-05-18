class Frontend::ActivitiesController < Frontend::ApplicationController

  def index
    @activities = Activity.page params[:page]
  end

  def show
    @activity = Activity.find params[:id]
    redirect_to root_path, :flash => { error: "目錄已移除" } and return unless @activity
  end

end
