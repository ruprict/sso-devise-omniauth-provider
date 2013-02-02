ClientApplication.delete_all
Account.delete_all

ClientApplication.create(
  :name => "secret",
  :app_id => "demo_id",
  :app_secret => "demo_secret"
)

Account.create(
  :username => "demo",
  :password_hash => Account.hash_password("password", "salt"),
  :password_salt => "salt",
  :status => "Active",
  :expiration_date => "2020-01-01"
)
