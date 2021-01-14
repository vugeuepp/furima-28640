FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '姓' }
    first_name            { '名' }
    last_reading          { 'セイ' }
    first_reading         { 'メイ' }
    birthday              { '2000-2-1' }
  end
end
