require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it '商品画像、商品名、商品の説明、商品カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があれば商品は出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品説明が空では出品できない' do
        @item.description_of_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description of item can't be blank")
      end
      it '商品カテゴリーが空では出品できない' do
        @item.product_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category can't be blank")
      end
      it '商品状態が空では出品できない' do
        @item.product_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end
      it '配送料の負担が空では出品できない' do
        @item.shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の地域が空では出品できない' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送までの日数が空では出品できない' do
        @item.day_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end
      it '販売価格が空では出品できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it '販売価格が¥300~¥9,999,999の間でないと出品できない' do
        @item.selling_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end
      it '販売価格は半角数字で記入しないと出品できない' do
        @item.selling_price = 'AAA'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
      it '販売価格が¥10,000,000以上では出品できない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end
      it 'Userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
