FactoryBot.define do
  factory :order_address do
    postal_number       { "123-4567" }
    prefecture_id       { Faker::Number.within(range: 2..48) }
    city                { Faker::Address.city }
    house_number        { Faker::Address.street_address }
    building_name       { Faker::Address.building_number }
    phone_number        { Faker::Number.leading_zero_number(digits: 11) }
  end
end