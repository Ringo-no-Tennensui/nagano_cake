class Item < ApplicationRecord
  has_one_attached :image
  enum sales_status: { sold_out: false, sale: true }
end
