class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :pastal_code,      null:false
      t.integer    :shipping_area_id, null:false
      t.string     :municipality,     null:false
      t.string     :address,          null:false
      t.string     :bulding_name
      t.string     :telephone_number, null:false
      t.references :purchase,         null:false
      t.timestamps
    end
  end
end
