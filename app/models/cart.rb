class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :count, presence: true
  
  # 商品毎の小計を算出
  def subtotal
    item.tax_price * count
  end
  
end
