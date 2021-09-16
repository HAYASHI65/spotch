class Level < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'まったり' },
    { id: 3, name: 'ややまったり' },
    { id: 4, name: 'ややガチ' },
    { id: 5, name: 'ガチ' }
  ]

  include ActiveHash::Associations
  has_many :teams
end
