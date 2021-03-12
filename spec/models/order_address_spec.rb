require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, product_id: product.id)
    sleep(0.125)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '全ての項目が正しく入力されていれば購入ができる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも購入ができる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'postal_numberが空では購入できない' do
        @order_address.postal_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number can't be blank")
      end
      it 'postal_numberにハイフン( - )がなければ購入できない' do
        @order_address.postal_number = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number is invalid. Include hyphen(-)")
      end
      it 'postal_numberが全角では購入できない' do
        @order_address.postal_number = "１２３ー４５６７"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number is invalid. Include hyphen(-)")
      end
      it 'postal_numberが半角文字列では購入できない' do
        @order_address.postal_number = "numbers"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number is invalid. Include hyphen(-)")
      end
      it 'prefectureが未選択（---)では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture select')
      end
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフン( - )があると登録できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角だと購入できない' do
        @order_address.phone_number = "０９０１２３４５６７８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角文字列だと購入できない' do
        @order_address.phone_number = "phonenumber"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが11桁以上では購入できない' do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが紐づいてなければ購入できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが紐づいていなければ購入できない' do
        @order_address.product_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Product can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
