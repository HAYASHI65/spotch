class Card < ApplicationRecord
  belongs_to :user
  attr_accessor :card_token

  validates :card_token, presence: true
end

# カードの情報が正しくないときは、card_tokenそのものがコントローラー側に送られない。そのためcard_tokenに対するバリデーションを設定し、保存段階で条件分岐させる#。
# なお、card_tokenを保存するカラムはcardsテーブルに存在しないため、バリデーションを設定するためにはattr_accessorでキーを指定する必要がある。
