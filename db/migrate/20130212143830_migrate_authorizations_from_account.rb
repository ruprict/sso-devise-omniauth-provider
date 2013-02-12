class MigrateAuthorizationsFromAccount < ActiveRecord::Migration
  def up
    Account.where("facebook_uid is not null or twitter_uid is not null").each do |acc|
      acc.authentications.create!(provider: 'facebook', uid: acc.facebook_uid) unless acc.facebook_uid.blank?
      acc.authentications.create!(provider: 'twitter', uid: acc.twitter_uid) unless acc.twitter_uid.blank?
    end
  end

  def down
    # Nothing to see here
  end
end
