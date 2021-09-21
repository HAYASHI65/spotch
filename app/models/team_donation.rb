class TeamDonation < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_one :donation
end
