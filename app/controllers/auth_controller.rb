class AuthController < ApplicationController
  before_filter :authenticate_account!, :except => [:access_token]
  skip_before_filter :verify_authenticity_token, :only => [:access_token]

  def welcome
  end

  def authorize
    AccessGrant.prune!
    access_grant = current_account.access_grants.create({:client => application, :state => params[:state]}, :without_protection => true)
    redirect_to access_grant.redirect_uri_for(params[:redirect_uri])
  end

  def access_token
    application = Client.authenticate(params[:client_id], params[:client_secret])

    if application.nil?
      render :json => {:error => "Could not find application"}
      return
    end

    access_grant = AccessGrant.authenticate(params[:code], application.id)
    if access_grant.nil?
      render :json => {:error => "Could not authenticate access code"}
      return
    end

    access_grant.start_expiry_period!
    session[:token] = access_grant.access_token
    render :json => {:access_token => access_grant.access_token, :refresh_token => access_grant.refresh_token, :expires_in => Devise.timeout_in.to_i}
  end

  def failure
    render :text => "ERROR: #{params[:message]}"
  end

  def user
    
    hash = {
      :provider => 'kyck_auth',
      :id => current_account.id.to_s,
      :info => {
         :email      => current_account.email,
      },
      :extra => {
         :first_name => current_account.first_name,
         :last_name  => current_account.last_name
      }
    }
    logger.info "** Rendering #{hash.inspect}"
    render :json => hash.to_json
  end

  # Incase, we need to check timeout of the session from a different application!
  # This will be called ONLY if the user is authenticated and token is valid
  # Extend the UserManager session
  def isalive
    warden.set_user(current_account, :scope => :account)
    response = { 'status' => 'ok' }

    respond_to do |format|
      format.any { render :json => response.to_json }
    end
  end

  protected

  def application
    @application ||= Client.find_by_app_id(params[:client_id])
  end

end
