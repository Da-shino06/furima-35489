class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :pastal_code, :shipping_area_id, :municipality, :address, :bulding_name, :telephone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :pastal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99999999999, message: "is invalid"}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping_adrress.create(pastal_code: pastal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, bulding_name: bulding_name, telephone_number: telephone_number, purchase_id: purchase_id)
  end
end