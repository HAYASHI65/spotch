class ActiveArea < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '安達区' },
    { id: 3, name: '荒川区' },
    { id: 4, name: '板橋区' },
    { id: 5, name: '江戸川区' },
    { id: 6, name: '太田区' },
    { id: 7, name: '葛飾区' },
    { id: 8, name: '北区' },
    { id: 9, name: '江東区' },
    { id: 10, name: '品川区' },
    { id: 11, name: '渋谷区' },
    { id: 12, name: '新宿区' },
    { id: 13, name: '杉並区' },
    { id: 14, name: '墨田区' },
    { id: 15, name: '世田谷区' },
    { id: 16, name: '台東区' },
    { id: 17, name: '千代田区' },
    { id: 18, name: '中央区' },
    { id: 19, name: '豊島区' },
    { id: 20, name: '中野区' },
    { id: 21, name: '練馬区' },
    { id: 22, name: '文京区' },
    { id: 23, name: '港区' },
    { id: 24, name: '目黒区' },
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :teams
end
