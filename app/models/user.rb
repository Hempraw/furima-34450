class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products

  with_options presence: true do
    validates :nickname, :birth_day
    validates :family_name, :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input full-width characters."}
    validates :family_name_kana, :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-with katakana characters."}
  end
  validates :password, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "Include both letters and numbers"}
end
