class ApplicationController < ActionController::Base

  before_filter :set_org

  protect_from_forgery

  # before_filter :set_locale


  private

  # def set_locale
  #     I18n.locale = params[:locale] if params[:locale].present?
  #     # request.env["HTTP_ACCEPT_LANGUAGE"]
  #     # current_user.locale
  #     # request.subdomain
  #     
  #     # request.remote_ip
  #   end

  # def default_url_options(options = {})
  #     {locale: I18n.locale}
  #   end

  def signup_complete
    begin
      @account = current_user.account
    rescue
    end
  end

  # def my_orgs
  #     begin
  #       @myorgs = current_user.account.organizations
  #     end
  #   end


  def set_org
    org_id = cookies[:chosen_org].to_i
    begin
      org_id > 0 ? @org = Organization.find(org_id) : @org = current_user.account.organizations.first

      @myorgs = current_user.account.organizations

      #@reseller = current_user.account.resellers.first
      @accounts = @reseller.accounts.includes(:organizations)
    rescue
    end

  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == USER_ID && password == PASSWORD
    end
  end

  def set_comps
    begin
      org_id = cookies[:chosen_org].to_i
      @org = Organization.find(org_id) unless org_id.nil?
      @comps = @org.organizations #TODO: scope security - now you could use cookie of someone else
    rescue
    end

    begin
      @comps = current_user.account.organizations.first.organizations unless @comps
    rescue
    end
  end
end
