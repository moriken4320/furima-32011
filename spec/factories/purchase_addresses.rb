FactoryBot.define do
  factory :purchase_address do
    postal_code { '111-1111' }
    prefecture_id { 1 }
    municipality { 'あああああ' }
    house_number { 'あああああ' }
    building_name { 'あああああ' }
    phone_number { 11_111_111_111 }
    token { Faker::Lorem.characters(number: 10) }

    association :user
    association :item
  end
end
