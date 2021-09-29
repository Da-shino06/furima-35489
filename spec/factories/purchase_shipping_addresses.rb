FactoryBot.define do
  factory :purchase_shipping_address do
    postel_code      { '123-4567' }
    shipping_area_id { 1 }
    municipality     { '横浜市' }
    address          { '青山1-1-1' }
    building_name    { '柳ビル103' }
    telephone_number { '19012345678' }
    token            { 'tok_abcdefghijk00000000000000000' }

    association :user
    association :item
  end
end
