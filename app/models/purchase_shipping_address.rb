class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postel_code, :shipping_area_id, :municipality, :address, :building_name,
                :telephone_number

  validates :token, presence: true
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :municipality, presence: true
  validates :address, presence: true

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postel_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :telephone_number, presence: true, format: { with: /\A\d{11}\z/, message: 'is invalid' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postel_code: postel_code, shipping_area_id: shipping_area_id, municipality: municipality,
                           address: address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end
