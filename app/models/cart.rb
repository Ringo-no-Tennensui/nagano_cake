class Cart < ApplicationRecord
  belongs_to :customers
  belongs_to :items
  
  validates :count, presence: true
end
