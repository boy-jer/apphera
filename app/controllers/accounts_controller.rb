class AccountsController < ApplicationController
  before_filter :authenticate_user!
  # caches_page :index

  def index
    unless current_user.account
      redirect_to new_account_path, :notice => t(:please_add_location) and return
    end
    @user = current_user
    begin
      @account = @user.account
    rescue
    end
    if @account == nil
      render :action => 'new'
    end
    @organizations = @account.organizations.order("name ASC")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @keyword }
    end
  end

  # GET /keywords/1/edit
  def edit
    user_account = current_user.account
    account = Account.find(params[:id])
    if account == user_account
      @account = account
    end

  end

  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to accounts_path, notice: t(:account_change_success) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /keywords
  # POST /keywords.json
  def create
    user = current_user
    acct = Account.new(params[:account])

    @acct = Account.create!(:name => acct.name, :firstname => acct.firstname, :lastname => acct.lastname, :phone => acct.phone, :account_type_id => 3)
    @acct.users << user

    respond_to do |format|
      if @acct.save
        format.html { redirect_to accounts_url, notice: t(:account_create_success) }
        format.json { render json: @acct, status: :created, location: @acct }
      else
        format.html { render action: "new" }
        format.json { render json: @acct.errors, status: :unprocessable_entity }
      end
    end
  end
end
