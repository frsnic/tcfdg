class Frontend::WebsController < Frontend::ApplicationController

  def index
    @activity = Activity.is_public.where("start_at > ?", Time.now).order('start_at asc').first
    @activity = Activity.is_public.where("start_at < ?", Time.now).first unless @activity

    respond_to do |format|
      format.html
      format.all { render file: 'public/404.html', status: 404 }
    end
  end

  def about_us
  end

  def contact_us
  end

  def date
    @begin_day = Date.new params[:year].to_i, params[:month].to_i, 1
    @recent_posts = Post.publish.where(posted_at: @begin_day..@begin_day + 1.month).page params[:page]
  end

  def send_email
    Resque.enqueue(MailJob, params)
    redirect_to contact_us_path, flash: { success: "發送成功" } and return
  end

end
