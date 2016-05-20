class Backend::ActivitiesController < Backend::ApplicationController

  def index
    @activities = Activity.page params[:page]
  end

  def show
  end

  def new
  end

  def create
    if @activity = Activity.create(activity_params)
      redirect_to activities_path, flash: { success: "新增成功" }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @activity.update activity_params
      redirect_to activities_path, flash: { success: "修改成功" }
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_path, flash: { success: "刪除成功" }
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :location, :start_at, :is_public, :link)
  end

end
