FactoryBot.define do
  factory :product do
    name                { Faker::Commerce.product_name }
    description         { Faker::Lorem.paragraph_by_chars }
    category_id         { Faker::Number.within(range: 2..11) }
    product_status_id   { Faker::Number.within(range: 2..7) }
    delivery_fee_id     { Faker::Number.within(range: 2..3) }
    prefecture_id       { Faker::Number.within(range: 2..48) }
    shipping_date_id    { Faker::Number.within(range: 2..4) }
    price               { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
