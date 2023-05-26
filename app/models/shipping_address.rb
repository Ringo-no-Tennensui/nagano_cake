class ShippingAddress < ApplicationRecord
  belongs_to :customer

  validates :ships_address, presence: true
  validates :ships_post_number, presence: true,numericality: { only_integer: true }, length: { is: 7 }
  validates :ships_name, presence: true

  # セレクトボタン内に1行でまとめて表示させるためのメソッド
  def address_display
    '〒' + ships_post_number + ' ' + ships_address + ' ' + ships_name
  end

end
