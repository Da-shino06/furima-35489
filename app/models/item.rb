class Item < ApplicationRecord
  validates :image, presence: true
  validates :product_name, presence: true
  validates :description_of_item, presence: true
  validates :selling_price, presence: true,
                            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :day_to_ship

  validates :product_category_id, :product_status_id, :shipping_charge_id, :shipping_area_id, :day_to_ship_id,
            numericality: { other_than: 0, message: "can't be blank" }

  belongs_to :user
  has_one_attached :image
end
