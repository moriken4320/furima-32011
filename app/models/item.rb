class Item < ApplicationRecord
  with_options presence: true do
    [:name, :description, :image].each do |v|
      validates v
    end
  end

  with_options numericality: { other_than: 0 } do
    [:category_id, :quality_status_id, :delivery_burden_id, :ship_from_location_id, :delivery_time_id].each do |v|
      validates v
    end
  end
  
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality_status
  belongs_to :delivery_burden
  belongs_to :ship_from_location
  belongs_to :delivery_time
end
