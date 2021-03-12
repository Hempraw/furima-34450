class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :address
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
