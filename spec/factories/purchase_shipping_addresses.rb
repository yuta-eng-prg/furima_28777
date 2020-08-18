FactoryBot.define do
  factory :purchase_shipping_address do
    user_id       { 1 }
    item_id       { 1 }
    postal_code   { '111-1111' }
    prefecture_id { 2 }
    city          { '東京市' }
    house_number  { '東京１−１' }
    building_name { '東京ビル' }
    phone_number  { '12345678901' }
  end
end
