class ShippingAddress < ApplicationRecord
  belongs_to :customers
  
  validates :ships_address, presence: true
  validates :ships_post_number, presence: true,numericality: { only_integer: true }, length: { is: 7 }
  validates :ships_name, presence: true
end
