require 'spec_helper'

describe AuthenticationsController do
  include Devise::TestHelpers
  describe "POST create" do
    context "a new user" do
      context "has logged in with twitter" do
        before(:each) do
          stub_env_for_twitter
        end

        it "should create a new account" do
          post :create  
          Account.where(email: 'ghost@nobody.com').first.should_not be_nil
        end
        it "should create a new authentication" do
          post :create  
          Authentication.where(provider: 'twitter', uid: '1234').first.should_not be_nil
        end

      end

    end
  end

  def stub_env_for_twitter
    # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
    @request.env["devise.mapping"] = Devise.mappings[:account]
    # WTF, warden?
    obj = Object.new
    obj.stub!(:user).and_return({})
    obj.stub!(:set_user).and_return({})

    env = { "omniauth.auth" => { "provider" => "twitter", "uid" => "1234", "extra" => { "raw_info" => { "email" => "ghost@nobody.com" } } },
    "warden" => obj}
    @request.stub!(:env).and_return(env)
  end
end
