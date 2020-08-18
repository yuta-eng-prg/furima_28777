require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address)
  end

  describe '商品購入機能' do
    context '商品の購入がうまくいくとき' do
      it 'user_id, item_id, postal_code, prefecture_id, city, house_number, building_name, phone_numberが存在すれば登録できる' do
        expect(@purchase_shipping_address).to be_valid
      end
    end
    context '商品の購入がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと登録できない' do
        @purchase_shipping_address.postal_code = '1111111'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空だと登録できない' do
        @purchase_shipping_address.prefecture_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと登録できない' do
        @purchase_shipping_address.city = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと登録できない' do
        @purchase_shipping_address.house_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @purchase_shipping_address.phone_number = '123456789012'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
