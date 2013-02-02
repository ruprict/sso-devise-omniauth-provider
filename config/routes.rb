OauthProviderDemo::Application.routes.draw do
  devise_for :accounts, :controllers => { :registrations => 'registrations',
                                       :sessions => 'sessions'}
  # omniauth client stuff
  match '/auth/:provider/callback', :to => 'authentications#create'
  match '/auth/failure', :to => 'authentications#failure'

  # Provider stuff
  match '/auth/kyck_auth/authorize' => 'auth#authorize'
  match '/auth/kyck_auth/access_token' => 'auth#access_token'
  match '/auth/kyck_auth/user' => 'auth#user'
  match '/oauth/token' => 'auth#access_token'


  # Account linking
  match 'authentications/:account_id/link' => 'authentications#link', :as => :link_accounts
  match 'authentications/:account_id/add' => 'authentications#add', :as => :add_account

  root :to => 'auth#welcome'
end
