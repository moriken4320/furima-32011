require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    context '商品が購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'postal_codeが空だと保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @purchase_address.postal_code = '2222222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeが「3桁数値＋ハイフン＋4桁数値」以外だと保存できない' do
        @purchase_address.postal_code = '22-222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'prefecture_idが空だと保存できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0だと保存できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture Select')
      end
      it 'municipalityが空だと保存できない' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空だと保存できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @purchase_address.phone_number = 111_111_111_111
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberが半角数値以外だと保存できない' do
        @purchase_address.phone_number = 'aaaaaaaaaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'tokenが空だと保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが存在しないと保存できない' do
        @purchase_address.user = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('User must exist')
      end
      it 'itemが存在しないと保存できない' do
        @purchase_address.item = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Item must exist')
      end
    end
  end
end
