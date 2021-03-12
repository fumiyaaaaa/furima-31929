FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number:2) }
    email { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 6)
    password { password }
    chinese_character_last_name { "草野" }
    chinese_character_first_name { "仁" }
    kana_last_name { "クサノ" }
    kana_first_name { "ヒトシ" }
    birthday { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end