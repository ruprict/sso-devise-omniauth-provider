Given /^an account that has authenticated with Twitter$/ do
  acc = Account.create!(first_name: 'Bob', last_name: 'Example', email: 'bob@example.com', password: 'password')
  acc.authentications.create!(provider:'twitter', uid: '12345')
end

When /^login with twitter$/ do
  visit '/accounts/auth/twitter'
end
