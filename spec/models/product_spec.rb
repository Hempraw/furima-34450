require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it '全ての項目が正しく入力されていれば出品ができる' do
        expect(@product).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'imageが空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが未選択（---)では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category select')
      end
      it 'product_statusが未選択（---)では登録できない' do
        @product.product_status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Product status select')
      end
      it 'delivery_feeが未選択（---)では登録できない' do
        @product.delivery_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery fee select')
      end
      it 'prefectureが未選択（---)では登録できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefecture select')
      end
      it 'shipping_dateが未選択（---)では登録できない' do
        @product.shipping_date_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping date select')
      end
      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが全角文字だと出品できない' do
        @product.price = '五千'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが半角文字だと出品できない' do
        @product.price = 'five hungred'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが300以下だと出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが9999999以上だと出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid')
      end
    end
  end
end
