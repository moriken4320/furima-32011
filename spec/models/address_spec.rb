require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  context "購入者情報が保存可能" do
    it "purchaseが紐づいていれば保存できる" do
      expect(@address).to be_valid 
    end
  end
  
  context "購入者情報が保存不可能" do
    it "purchaseが紐づいていなければ保存できない" do
      @address.purchase = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Purchase must exist") 
    end
  end
end
