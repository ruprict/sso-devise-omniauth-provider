class RegistrationsController < Devise::RegistrationsController
  def new
    # Building the resource with information that MAY BE available from omniauth!
    first_name, last_name = get_names
    @hide_password = session[:omniauth].present?
    build_resource(:first_name => first_name, :last_name => last_name, :email => session[:omniauth_email] )
    render :new
  end

  def create
    build_resource

    if session[:omniauth] && @account.errors[:email][0] =~ /has already been taken/
      account = Account.find_by_email(@account.email)
      # Link Accounts - if via social connect
      return redirect_to link_accounts_url(account.id)
    end

    resource.password = resource.password_confirmation = Devise.friendly_token if session[:omniauth].present? && resource.new_record?

    # normal processing
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
      flash[:notice] = "Account Created"
      session[:omniauth] = nil unless @account.new_record?
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def after_update_path_for(scope)
    session[:referrer] ? session[:referrer] : root_path
  end

  private

  def build_resource(*args)
    super

    if session[:omniauth]
      @account.apply_omniauth(session[:omniauth])
      @account.valid?
    end
  end

  def get_names
    return unless session[:omniauth] && session[:omniauth]['info'] && session[:omniauth]['info']['name']
    Rails.logger.info session[:omniauth]['info']['name']
    session[:omniauth]['info']['name'].split
  end
end
