FactoryBot.define do
  factory :donation_object do
    price { 3000 }
    text { Faker::Lorem.sentence }
  end
end
