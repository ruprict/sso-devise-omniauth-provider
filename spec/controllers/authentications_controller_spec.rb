require 'spec_helper'

describe AuthenticationsController do

  describe "POST create" do
    context "a new user" do
      context "has logged in with twitter" do

        it "should create a new account" do
          post :create  
        end
        it "should create a new authentication" 

      end

    end
  end
  def stub_env_for_omniauth
    # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
    request.env["devise.mapping"] = Devise.mappings[:account]
    env = { "omniauth.auth" => { "provider" => "facebook", "uid" => "1234", "extra" => { "user_hash" => { "email" => "ghost@nobody.com" } } } }
    @controller.stub!(:env).and_return(env)
  end
end
