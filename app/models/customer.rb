class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum member_status: { exist: false, withdraw: true }

  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :post_code, presence: true,numericality: { only_integer: true }, length: { is: 7 }
  validates :address, presence: true
  validates :phone_number, presence: true,numericality: { only_integer: true }, length: { minimum: 10,maximum: 11}
  validates :email, presence: true
  validates :encrypted_password, presence: true,length: { minimum: 6 }

  # 氏名をまとめたメソッド
  def customer_name
    last_name + first_name
  end

  # 姓か名に１文字でも該当するキーワードがあればとってくる
  def self.looks(search, word)
      @customers = Customer.where("first_name LIKE? OR last_name LIKE? OR first_name_kana LIKE? OR last_name_kana LIKE? OR phone_number LIKE? OR address LIKE? OR email LIKE?",
      "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%")
  end

end
