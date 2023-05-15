class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,      null: false
      t.text :ships_address,       null: false
      t.string :ships_post_number, null: false
      t.string :ships_name,        null: false
      t.integer :payment,          null: false, default: 0
      t.integer :pay_price,        null: false
      t.integer :order_status,     null: false, default: 0
      t.integer :shipping_cost,    null: false

      t.timestamps
    end
  end
end
