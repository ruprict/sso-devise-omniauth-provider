require 'spec_helper'

describe Account do
  describe "#full_name" do
    it "should combine the first and last name" do
      a = Account.new(first_name: 'Fred', last_name: 'Flintstone')
      a.full_name.should == 'Fred Flintstone'
    end
  end
end
