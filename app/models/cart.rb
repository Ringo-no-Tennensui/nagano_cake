class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :count, presence: true
end
