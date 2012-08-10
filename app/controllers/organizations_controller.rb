class OrganizationsController < ApplicationController
  require 'social_media_monitoring'
  before_filter :authenticate_user!
  before_filter :set_org
  before_filter :set_comps
  # GET /organizations
  # GET /organizations.json
  #caches_page :index
  def index
    unless @org
      redirect_to new_account_path, :notice => t(:please_add_location) and return
    end
    begin
      @organizations = @comps.order('name ASC').page params[:page]
        # @mapjson =  [lat:37.7381599, lng:-122.3803166 ].to_json  #[{"lat":37.7381599,"lng":-122.3803166},{"lat":37.5121003,"lng":-122.2009814},{"lat":33.9964092,"lng":-118.4725106}]


    rescue
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizations }
    end
  end

  def mapview
    @gmap = @comps.to_gmaps4rails do |organization, marker|
      # marker.json({ :id => organization.id, :name => organization.name })
      marker.title organization.name
      #"\"id\": #{organization.id}"
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizations }
    end
  end

  def myorgs
    if current_user

      respond_to do |format|

        format.json { render json: @myorgs }
      end
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  # def show
  # 
  #     redirect_to accounts_url, :notice => t(:please_add_location) and return
  #   end

  # GET /organizations/new
  # GET /organizations/new.json
  def new
    @categories = Category.all(:order => "name ASC")

    @cats = (Category.all(:select => "name").collect { |c| c.name }).join(', ')
    @organization = Organization.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end


  # GET /organizations/1/edit
  def edit

    @categories = Category.all(:order => "name ASC")
    organization = Organization.where("id = ?", params[:id]).first
    org_account = organization.account
    user_account = current_user.account
    if org_account == user_account # TODO: need move it to model
      @organization = organization
    end


  end

  # POST /organizations
  # POST /organizations.json
  # @organization2 is being used as a means to update the information we have in the database -> TODO: validate ownership
  def create
    @categories = Category.all(:order => "name ASC")
    @organization = Organization.new(params[:organization])
    @organization2 = Organization.new(params[:organization])
    # if current_user.reseller?
    #       account = current_user.resellers.first.accounts.find(params[:organization]["account_id"])
    #     else
    account = current_user.account
    # end
    uuid = UUID.new
    name_ = @organization.name
    name_part = name_[0..name_.length-4]
    street_ = @organization.street
    street_part = street_[0..street_.length-4]
    city_part = @organization.city
    postal_part = @organization.postalcode

    @existing_org = Organization.where("name like ? and street like ? and city = ? and postalcode = ?", name_part + "%", street_part + "%", city_part, postal_part).first

    if @existing_org
      account.organizations << @existing_org unless @existing_org.account
      Schedule.create(organization_id: @existing_org.id, sequence_id: 6, name: "new", in_progress: false, scheduled: "2000-01-01 00:00:00")
      @existing_org.name = @organization2.name
      @existing_org.street = @organization2.street
      @existing_org.phone1 = @organization2.phone1
      @existing_org.url = @organization2.url
      if @organization.facebook
        fb = FacebookUrl.new(:url => @organization.facebook)
        @existing_org.facebook_urls << fb
      end
      if @organization.twitter
        tw = TwitterUrl.new(:url => @organization.twitter)
        @existing_org.twitter_urls << tw
      end
      @existing_org.save
      @existing_org.get_apphera_comps

      Schedule.create(organization_id: @existing_org.id, sequence_id: 5, name: "aggregate", in_progress: false, scheduled: "2000-01-01 00:00:00")
      respond_to do |format|
        # if current_user.reseller?
        #           format.html { redirect_to reseller_accounts_path, notice: t(:organization_create_success) }
        #         else
        format.html { redirect_to accounts_path, notice: t(:organization_create_success) }
        # end
      end
    else
      @organization.apphera_id = 0 # ad the slug has to be unique I just generate a UUID here and replace later TODO: replace with GEO
      account.organizations << @organization
      respond_to do |format|
        if @organization.save
          @organization.get_apphera_comps

          if @organization.facebook
            fb = FacebookUrl.new(:url => @organization.facebook)
            @organization.facebook_urls << fb
          end
          if @organization.twitter
            tw = TwitterUrl.new(:url => @organization.twitter)
            @organization.twitter_urls << tw
          end
          @organization.save

          respond_to do |format|
            # if current_user.reseller?
            #               format.html { redirect_to reseller_accounts_path, notice: t(:organization_create_success) }
            #             else
            format.html { redirect_to accounts_path, notice: t(:organization_create_success) }
            # end
          end
        else
          format.html { render action: "new" }
          format.json { render json: @organization.errors, status: :unprocessable_entity }
        end
      end
    end
  end

# PUT /organizations/1
# PUT /organizations/1.json
#TODO: secure this!
  def update
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if @organization.update_attributes(params[:organization])

        format.html { redirect_to accounts_path, notice: t(:organization_update_success) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /organizations/1
# DELETE /organizations/1.json

  def destroy

    @organization = Organization.find(params[:id])

    # if current_user.reseller?
    #           @acc = current_user.account #fixme!
    #         else
    @acc = current_user.account.organizations.where("id = ?", @organization.id).first
    # end

    if @acc
      @organization.account_id = 0
      @organization.save
    else
      @org.organizations.delete(@organization)
      @org.save
    end

    respond_to do |format|
      format.html { redirect_to (:back) }
      format.json { head :ok }
    end
  end

end
