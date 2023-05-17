class ItemGenre < ApplicationRecord
  has_many :items, dependent: :destroy
  
  validates :genre, presence: true
end
