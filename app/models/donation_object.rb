class DonationObject
  include ActiveModel::Model
  attr_accessor :user_id, :team_id, :price, :text

  with_options presence: true do
    validates :user_id
    validates :team_id
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 1000, less_than_or_equal_to: 1_000_000,
                              message: 'は¥1,000~9,999,999の間で、半角数字で入力してください' }
  end

  def save
    team_donation = TeamDonation.create(user_id: user_id, team_id: team_id)
    Donation.create(price: price, text: text, team_donation_id: team_donation.id)
  end
end
