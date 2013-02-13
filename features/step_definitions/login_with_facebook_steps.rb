Given /^an account that has authenticated with Facebook$/ do
  acc = Account.create!(first_name: 'Bob', last_name: 'Example', email: 'bob@example.com', password: 'password')
  acc.authentications.create!(provider:'facebook', uid: '12345')
end

When /^login with facebook$/ do
  visit '/accounts/auth/facebook'
end
