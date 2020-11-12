require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  context '購入情報が保存可能' do
    it 'user,itemと紐づいていれば保存できる' do
      expect(@purchase).to be_valid
    end
  end

  context '購入情報が保存不可能' do
    it 'userが紐づいていなければ保存できない' do
      @purchase.user = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('User must exist')
    end
    it 'itemが紐づいていなければ保存できない' do
      @purchase.item = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Item must exist')
    end
  end
end
