Given /^I am on the new_account_registration page$/ do
  visit new_account_registration_url
end

When /^I ask to register with twitter$/ do
  visit '/accounts/auth/twitter'
end

Then /^I am redircted to the new registration page$/ do
  current_url.should == new_account_registration_url
end

Then /^it should show my name$/ do
  find("input#account_first_name").value.should == 'Bob'
  find("input#account_last_name").value.should == 'Example'
end

Then /^it should not show the password$/ do
  page.should_not have_selector('input#account_password')
end

Then /^it should ask for my email$/ do
  page.should have_content("Email can't be blank")
end

Given /^I have authenticated with Twitter and authorized the app$/ do
  visit '/accounts/auth/twitter'
end

When /^I provide my email$/ do
  fill_in 'account_email', with: 'bob@example.com'
  click_button 'Sign up'
end

Then /^I should get an account$/ do
  Account.where(email: 'bob@example.com').first.should_not be_nil
end

Then /^be redirected to the home page$/ do
  current_url.should == root_url
end

