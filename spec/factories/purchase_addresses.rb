FactoryBot.define do
  factory :purchase_address do
    user_id {1}
    item_id {1}
    postal_code {'111-1111'}
    prefecture_id {1}
    municipality {"あああああ"}
    house_number {"あああああ"}
    building_name {"あああああ"}
    phone_number {11111111111}
    token {Faker::Lorem.characters(number: 10)}
  end
end
