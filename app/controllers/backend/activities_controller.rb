class Backend::ActivitiesController < Backend::ApplicationController

  def index
    @activities = Activity.page params[:page]
  end

  def show
    @activity = Activity.find params[:id]
  end

  def new
    @activity = Activity.new
  end

  def create
    if @activity = Activity.create(activity_params)
      redirect_to activities_path, flash: { success: "新增成功" }
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find params[:id]
  end

  def update
    @activity = Activity.find params[:id]
    if @activity.update activity_params
      redirect_to activities_path, flash: { success: "修改成功" }
    else
      render :edit
    end
  end

  def destroy
    @activity = Activity.find params[:id]
    @activity.destroy
    redirect_to activities_path, flash: { success: "刪除成功" }
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :location, :start_at, :is_public, :link)
  end

end
