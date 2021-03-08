FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.name }
    email                   { Faker::Internet.free_email }
    password                { '111aaa' }
    password_confirmation   { password }
    family_name             { '山田' }
    first_name              { '太郎' }
    family_name_kana        { 'ヤマダ' }
    first_name_kana         { 'タロウ' }
    birth_day               { Faker::Date.in_date_period }
  end
end
