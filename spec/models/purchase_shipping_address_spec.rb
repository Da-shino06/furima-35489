require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep(1)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id, item_id: item.id)
    end

    context '商品を購入できる場合' do
      it '必要な情報を正しく入力できていると購入できること' do
        expect(@purchase_shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_shipping_address.building_name = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end
    context '商品を購入できない場合' do
      it 'postel_codeが空だと保存できないこと' do
        @purchase_shipping_address.postel_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postel code can't be blank")
      end
      it 'postel_codeが半角のハイフンを含んだ正しい形で入力しないと保存できないこと' do
        @purchase_shipping_address.postel_code = 1_111_111
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postel code is invalid. Include hyphen(-)')
      end
      it 'shipping_areaが空だと保存できないこと' do
        @purchase_shipping_address.shipping_area_id = 0
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @purchase_shipping_address.municipality = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_shipping_address.address = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchase_shipping_address.telephone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberは11桁以内の数値でなければ保存できないこと' do
        @purchase_shipping_address.telephone_number = 112_345_678_909
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberは9桁以下の数値では保存できないこと' do
        @purchase_shipping_address.telephone_number = 112_345
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberは12桁以上の数値では保存できないこと' do
        @purchase_shipping_address.telephone_number = 112_345_678_909_111
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_shipping_address.user_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_shipping_address.item_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できないこと' do
        @purchase_shipping_address.token = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
