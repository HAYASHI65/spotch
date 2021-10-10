class Group < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '部活動' },
    { id: 3, name: 'クラブチーム' },
    { id: 4, name: '同好会' },
    { id: 5, name: 'サークル' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :teams
end
