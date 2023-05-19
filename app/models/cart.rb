class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :count, presence: true
  
  def subtotal
    item.tax_price * count
  end
  
end
