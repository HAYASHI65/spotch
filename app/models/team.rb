class Team < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :team_name, presence: { message: 'を入力してください' }
    validates :sports_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :group_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :active_area_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :active_day_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :active_time_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :place, presence: { message: 'を入力してください' }
    validates :gender_ratio, presence: { message: 'を入力してください' }
    validates :level_id, numericality: { other_than: 1, message: 'を入力してください' }
  end
end
