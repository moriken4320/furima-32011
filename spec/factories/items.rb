FactoryBot.define do
  factory :item do
    name { 'aaaa' }
    description { 'aaaaaaaaaaaaa' }
    category_id { 1 }
    quality_status_id { 1 }
    delivery_burden_id { 1 }
    ship_from_location_id { 1 }
    delivery_time_id { 1 }
    price { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
