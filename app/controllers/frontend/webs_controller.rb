class Frontend::WebsController < Frontend::ApplicationController

  def index
    @activity = Activity.is_public.where("start_at > ?", Time.now).order('start_at asc').first
    @activity = Activity.is_public.where("start_at < ?", Time.now).first unless @activity
  end

  def about_us
  end

  def contact_us
  end

  def date
    @begin_day = Date.new(params[:year].to_i, params[:month].to_i, 1)
    @recent_posts = Post.post.publish.where(posted_at: @begin_day..@begin_day + 1.month).page params[:page]
  end

  def send_email
    Mailer.contact(params).deliver_later
    redirect_to contact_us_path, success: "發送成功" and return
  end

end
