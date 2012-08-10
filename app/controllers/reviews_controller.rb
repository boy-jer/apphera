class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_org

  # GET /reviews
  # GET /reviews.json
  def index
    unless @org
      redirect_to new_account_path, :notice => t(:please_add_location) and return
    end
    if params[:query].present?
      @reviews = Review.search(params, @org.id)
    else
      @reviews = Review.all_reviews(@org.id)
    end
    @cps = ContentProvider.all.index_by(&:id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  def index2
    unless @org
      redirect_to new_account_path, :notice => t(:please_add_location) and return
    end
    if params[:query].present?
      @reviews = Review.search(params, @org.id)
    else
      @reviews = Review.all_reviews(@org.id)
    end

    s
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end


  def show
    unless @org
      redirect_to new_account_path, :notice => t(:please_add_location) and return
    end
    @cps = ContentProvider.all.index_by(&:id)

    org_id = params[:id]
    @comp_name = Organization.find_by_id(org_id).name

    if params[:query].present?
      @reviews = Review.search(params, org_id)
    else
      @reviews = Review.all_reviews(org_id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reviews }
    end
  end

end
