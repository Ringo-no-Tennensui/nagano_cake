class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :customer_id,  null: false
      t.integer :item_id,      null: false
      t.integer :count,        null: false

      t.timestamps
    end
  end
end
