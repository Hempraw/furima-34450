class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_number, :prefecture_id, :city, :house_number,
                :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: ""}
  end
  valodates :prefecture_id, numericality: { other_than: 1, message: 'select' }

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Addrss.create(postal_number: postal_number, city: city, house_number: house_number,
                  phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)
end