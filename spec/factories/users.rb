FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    gender_id { 2 }
    birthday { Faker::Date.backward }

    nickname { Faker::Name.initials(number: 2) }
    sports_id { 2 }
    active_area_id { 2 }
    active_day_id { 2 }
    active_time_id { 2 }
    achievement_id { 2 }
    achievement_content { Faker::Lorem.sentence }
    profile { Faker::Lorem.sentence }

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
