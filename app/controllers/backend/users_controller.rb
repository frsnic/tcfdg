class Backend::UsersController < Backend::ApplicationController

  def index
    @users = User.page params[:page]
  end

  def show
    @recent_posts = @user.posts.page params[:page]
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), flash: { success: "新增成功" }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    params[:user].delete(:role) unless can? :manage, User

    if @user.update user_params
      redirect_to user_path, flash: { success: "修改成功" }
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, flash: { success: "刪除成功" }
  end

  private

  def user_params
    params.require(:user).permit(:email, :identify, :name, :role, :password, :password_confirmation)
  end

end
