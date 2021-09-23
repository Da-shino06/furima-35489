FactoryBot.define do
  factory :item do
    product_name         { 'あつし' }
    description_of_item  { '20歳です。' }
    product_category_id  { 1 }
    product_status_id    { 1 }
    shipping_charge_id   { 1 }
    shipping_area_id     { 1 }
    day_to_ship_id       { 1 }
    selling_price        { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
