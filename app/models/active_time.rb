class ActiveTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '9:00~11:00' },
    { id: 3, name: '11:00~13:00' },
    { id: 4, name: '13:00~15:00' },
    { id: 5, name: '15:00~17:00' },
    { id: 6, name: '17:00~19:00' },
    { id: 7, name: '19:00~21:00' },
    { id: 8, name: '全ての時間帯が可能' }
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :teams
end
