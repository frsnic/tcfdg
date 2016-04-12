class Frontend::ActivitiesController < Frontend::ApplicationController

  def index
    @activities = Activity.page params[:page]
  end

  def show
    @activity = Activity.find params[:id]
  end

end
