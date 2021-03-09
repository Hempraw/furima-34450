class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :product_status
    belongs_to :delivery_fee
    belongs_to :prefecture
    belongs_to :shipping_date

  with_options presence: true do
    validates :name, :description, :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end
  validates :category_id, :product_status_id, :delivery_fee_id, :prefecture_id, :shipping_date_id, numericality:{other_than: 1, message: "select"}
end
