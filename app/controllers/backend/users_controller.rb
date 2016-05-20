class Backend::UsersController < Backend::ApplicationController

  def index
    @users = User.page params[:page]
  end

  def show
    @user = User.find params[:id]
    @recent_posts = @user.posts.page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.find_or_create_by(user_params)
      redirect_to users_path, flash: { success: "新增成功" }
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      redirect_to users_path, flash: { success: "修改成功" }
    else
      render :edit
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_path, flash: { success: "刪除成功" }
  end

  private

  def user_params
    params.require(:user).permit(:email, :identify)
  end

end
