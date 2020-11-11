require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it 'name,desctiption,imageが存在していて、category_id,quality_status_id,delivery_burden_id,ship_from_location_id,delivery_time_idが0以外の数値で、priceが300~9999999の整数で、userが紐づいていれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'nameが空だと保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと保存できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが空だと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが0だと保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'quality_status_idが空だと保存できない' do
        @item.quality_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality status can't be blank")
      end
      it 'quality_status_idが0だと保存できない' do
        @item.quality_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Quality status Select')
      end
      it 'delivery_burden_idが空だと保存できない' do
        @item.delivery_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end
      it 'delivery_burden_idが0だと保存できない' do
        @item.delivery_burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery burden Select')
      end
      it 'ship_from_location_idが空だと保存できない' do
        @item.ship_from_location_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from location can't be blank")
      end
      it 'ship_from_location_idが0だと保存できない' do
        @item.ship_from_location_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship from location Select')
      end
      it 'delivery_time_idが空だと保存できない' do
        @item.delivery_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it 'delivery_time_idが0だと保存できない' do
        @item.delivery_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery time Select')
      end
      it 'priceが空だと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外だと保存できない' do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが299以下の数値だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが10000000以上の数値だと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
