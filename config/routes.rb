OauthProviderDemo::Application.routes.draw do
  devise_for :accounts, :controllers => { :registrations => 'registrations',
                                       :sessions => 'sessions'}

  resources :authentications 
  # omniauth client stuff
  match '/accounts/auth/:provider/callback', :to => 'authentications#create'
  match '/accounts/auth/failure', :to => 'authentications#failure'


  # Provider stuff
  match '/authorize' => 'auth#authorize'
  match '/access_token' => 'auth#access_token'
  match '/auth/user' => 'auth#user'
  match '/oauth/token' => 'auth#access_token'


  # Account linking
  match 'authentications/:account_id/link' => 'authentications#link', :as => :link_accounts
  match 'authentications/:account_id/add' => 'authentications#add', :as => :add_account

  root :to => 'auth#welcome'
end
