class ActiveArea < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '杉並区' },
    { id: 3, name: '港区' },
    { id: 4, name: '大田区' },
    { id: 5, name: '足立区' },
    { id: 6, name: '新宿区' },
    { id: 7, name: '渋谷区' }
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :teams
end
