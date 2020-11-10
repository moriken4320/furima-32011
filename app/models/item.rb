class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :quality_status_id
      validates :delivery_burden_id
      validates :ship_from_location_id
      validates :delivery_time_id
    end
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :user
    validates :image
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality_status
  belongs_to :delivery_burden
  belongs_to :ship_from_location
  belongs_to :delivery_time
end
