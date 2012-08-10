class KeywordsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_org

  # GET /keywords
  # GET /keywords.json
  def index
    unless @org
      redirect_to new_account_path, :notice => t(:add_location) and return
    end

    @keywords = @org.keywords

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @keywords }
    end
  end

  # GET /keywords/1
  # GET /keywords/1.json
  def show

    if @org.keywords
      @url = @org.url || "93287d8unhwcfhklwjeh8"
      @keywords = @org.keywords
      Tire.configure do
        url "127.0.0.1:9200"
      end
      kw_id = params[:id]
      s = Tire.search 'ranks' do
        query do
          string "keyword_id:#{kw_id}"
        end
      end
      @keyword = s.results[s.results.length-1] || s.results[0]
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @keyword }
      end
    else
      format.html { redirect_to keywords_url, notice: t('unkown_keyword') }

    end

  end

  # GET /keywords/new
  # GET /keywords/new.json
  def new
    @keyword = Keyword.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @keyword }
    end
  end

  # # GET /keywords/1/edit
  #  def edit
  #    @keyword = Keyword.find(params[:id])
  #  end

  # POST /keywords
  # POST /keywords.json
  def create


    kw = Keyword.new(params[:keyword])
    @newkey = Keyword.find_or_create_by_name(:name => kw.name)
    @org.keywords << @newkey

    respond_to do |format|
      if @newkey.save
        # Resque.enqueue(Ranks, @newkey.id, org.id, 8, 5) #keyword_id, organization_id, content_provider_id, attempts
        #        Resque.enqueue(Ranks, @newkey.id, org.id, 9, 5)
        format.html { redirect_to keywords_url, notice: t('keyword_create_success') }
        format.json { render json: @keyword, status: :created, location: @keyword }
      else
        format.html { render action: "new" }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /keywords/1
  # PUT /keywords/1.json


  # DELETE /keywords/1
  # DELETE /keywords/1.json
  def destroy
    #org = current_user.account.organizations.first
    @keyword = Keyword.find(params[:id])

    @org.keywords.delete(@keyword)
    respond_to do |format|
      format.html { redirect_to keywords_url }
      format.json { head :ok }
    end
  end
end
