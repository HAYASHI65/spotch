FactoryBot.define do
  factory :team do
    team_name { Faker::Name.initials(number: 2) }
    sports_id { 2 }
    group_id { 2 }
    active_area_id { 2 }
    active_day_id { 2 }
    active_time_id { 2 }
    place { Faker::Lorem.sentence }
    gender_ratio { Faker::Lorem.sentence }
    level_id { 2 }
    profile { Faker::Lorem.sentence }

    association :user

    after(:build) do |team|
      team.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
