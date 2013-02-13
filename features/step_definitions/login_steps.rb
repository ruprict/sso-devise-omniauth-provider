Given /^an existing account/ do
  Account.create(first_name: 'Fred', last_name: 'Flintstone', email: 'test@test.com', password:'password')
end

When /^I visit the app$/ do
  visit root_url
end

And /^provide my login information$/ do
  fill_in 'account_email', with: 'test@test.com'
  fill_in 'account_password', with: 'password'
  click_button 'Sign in'
end

Then /^I should be logged in$/ do
  current_url.should == root_url
end
