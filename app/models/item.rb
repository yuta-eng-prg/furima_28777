class Item < ApplicationRecord
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_until_shipping
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category, numericality: { other_than: 1 }
    validates :status, numericality: { other_than: 1 }
    validates :shipping_fee_burden, numericality: { other_than: 1 }
    validates :shipping_region, numericality: { other_than: 1 }
    validates :days_until_shipping, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end




end
