class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :teams

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
    validates :gender_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :birthday
    validates :nickname, presence: { message: 'を入力してください' }
    validates :sports_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :active_area_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :active_day_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :active_time_id, numericality: { other_than: 1, message: 'を入力してください' }
  end
end
