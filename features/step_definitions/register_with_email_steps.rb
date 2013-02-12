Given /^I am on the sign up page$/ do
  visit new_account_registration_url
end

When /^I provide my registration information$/ do
  fill_in :account_first_name, with: "Fred"
  fill_in :account_last_name, with: "Flintstone"
  fill_in :account_email, with: 'fred@bedrockisp.com'
  fill_in :account_password, with: 'password'
  fill_in :account_password_confirmation, with: 'password'
  click_button 'Sign up'
end

Then /^I should have a new account$/ do
  Account.where(email: 'fred@bedrockisp.com').first.should_not be_nil 
end

And /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end
