class Authentication < ActiveRecord::Base
  belongs_to :account
  attr_accessible :uid, :provider

  validates :uid, :provider, presence: true
end
