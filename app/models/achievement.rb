class Achievement < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '初心者' },
    { id: 3, name: '市大会出場' },
    { id: 4, name: '県大会出場' },
    { id: 5, name: '全国大会出場' }
  ]

  include ActiveHash::Associations
  has_many :users
end
