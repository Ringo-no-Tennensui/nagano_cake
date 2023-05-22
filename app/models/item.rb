class Item < ApplicationRecord
  has_one_attached :image
  enum sales_status: { sold_out: false, sale: true }

  has_many :carts, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :item_genre



  validates :item_name, presence: true
  validates :item_explanation,length: { in: 1..140 }
  validates :item_price, presence: true,numericality: { only_integer: true }

  def tax_price
    (item_price * 1.1).floor
  end

  def get_image(width, height)
    (image.attached?) ? image : 'no_image.jpg'
    image.variant(resize_to_limit: [width, height]).processed
  end
end
