FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    last_name_kana        { gimei.last.katakana }
    first_name_kana       { gimei.first.katakana }
    birth_date            { Faker::Date.birthday }
  end
end
