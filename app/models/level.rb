class Level < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '緩い/まったり' },
    { id: 3, name: 'やや緩い/ややまったり' },
    { id: 4, name: 'やや強い/やや厳しい' },
    { id: 5, name: '強い/厳しい' }
  ]

  include ActiveHash::Associations
  has_many :teams
end
