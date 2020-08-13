FactoryBot.define do
  factory :item do
    name                   { 'himawari' }
    description            { 'himawari' }
    category_id            { 2 }
    status_id              { 2 }
    shipping_fee_burden_id { 2 }
    shipping_region_id     { 2 }
    days_until_shipping_id { 2 }
    price                  { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'test.jpg')), filename: 'test.jpg')
    end
  end
end
