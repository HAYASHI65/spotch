class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :sports
  belongs_to :active_area
  belongs_to :active_day
  belongs_to :active_time
  belongs_to :achievement
  has_many :teams, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_many :approves, dependent: :destroy
  has_many :team_donations
  has_many :rooms, through: :user_rooms
  has_many :user_rooms
  has_many :chats
  has_one :card, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
    validates :gender_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :birthday
    validates :image, presence: { message: 'を選択してください' }
    validates :nickname, presence: { message: 'を入力してください' }
    validates :sports_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :active_area_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :active_day_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :active_time_id, numericality: { other_than: 1, message: 'を入力してください' }
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i , message: "は6文字以上の半角英数字で入力してください"}
end
