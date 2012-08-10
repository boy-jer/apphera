class HomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_org
  #caches_page :index

  #before_filter :no_cache
  def index
    #unless @org
    #  redirect_to new_account_path, :notice => t(:please_add_location) and return
    #end
    if @org && current_user
      @tasks = @org.task_results.includes(:task).where("status > ?", 0)
      @server = @org.uptime_monitors.last
      if @org.aggregate_results.nil?
        Schedule.create!(sequence_id: 5, scheduled: "2000-01-01 00:00:00", organization_id: @org.id, name: "aggregate-controller", in_progress: false)
      end
      @aggregate = @org.aggregate_results.last
      render :action => "/dashboard"
    else
      redirect_to new_account_path, :notice => t(:please_add_location) and return
    end
  end

  def network

    counts = DatabaseCount.last

    @tweets = counts.tweets.to_s.reverse.gsub(/...(?=.)/, '\&,').reverse
    @twitter_users = counts.twitter_users.to_s.reverse.gsub(/...(?=.)/, '\&,').reverse

    @sentiments = NetworkWeather.all
    respond_to do |format|
      format.html
      format.json { render json: @counts }
    end

  end

  def dashboard

    @recommendations = Recommendation.all
  end

  def no_cache
    response.headers["Last-Modified"] = Time.now.httpdate
    response.headers["Expires"] = '0'
    response.headers["Pragma"] = "no-cache"
    response.headers["Cache-Control"] = 'no-store, no-cache, must-revalidate, max-age=0, pre-check=0, post-check=0'
  end

end
 