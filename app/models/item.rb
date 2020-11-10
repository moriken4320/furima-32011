class Item < ApplicationRecord
  [:name, :description, :category_id, :quality_status_id, :delivery_burden_id, :ship_from_location_id, :delivery_time_id, :price,:user, :image].each do |v|
    validates v, presence: true
  end

  belongs_to :user
  has_one_attached :image
end