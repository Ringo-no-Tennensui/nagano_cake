class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id,       null: false
      t.text :ships_address,        null: false
      t.string :ships_post_number,  null: false
      t.string :ships_name,         null: false

      t.timestamps
    end
  end
end
