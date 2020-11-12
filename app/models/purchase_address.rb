class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly" } #ハイフン必須
    validates :prefecture_id, numericality: {other_than: 0, message: "Select"} #0以外
    [:municipality, :house_number].each do |v|
      validates v
    end
    validates :phone_number, length: {maximum: 11}, numericality: { only_integer: true, message: "Input only number" } #11桁以内,自然数オンリー
  end


  def save
    purchase = Purchase.create(user_id: current_user.id, item_id: params[:id])
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
