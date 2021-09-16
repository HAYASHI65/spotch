class Sports < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '野球' },
    { id: 3, name: 'サッカー' },
    { id: 4, name: 'テニス' },
    { id: 5, name: 'バスケットボール' },
    { id: 6, name: 'バレーボール' },
    { id: 7, name: 'バドミントン' }
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :teams
end
