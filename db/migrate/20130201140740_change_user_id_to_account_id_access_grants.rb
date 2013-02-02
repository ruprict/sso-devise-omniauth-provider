class ChangeUserIdToAccountIdAccessGrants < ActiveRecord::Migration
  def up
    rename_column :access_grants, :user_id, :account_id
  end

  def down
    rename_column :access_grants, :account_id, :user_id
  end
end
