class Team < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sports
  belongs_to :group
  belongs_to :active_area
  belongs_to :active_day
  belongs_to :active_time
  belongs_to :level

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :image, presence: { message: 'を選択してください' }
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

  def favorited?(user)
    favorites.where(user_id: user.id).exists? #引数のuserと同じidをuser_idにもつfavoriteレコードは存在する？のメソッド
  end

  def applied?(user)
    applies.where(user_id: user.id).exists? #引数のuserと同じidをuser_idにもつapplyレコードは存在する？のメソッド
  end
end
