class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :item_genre_id,       null: false
      t.string :item_name,       null: false
      t.text :item_explanation,  null: false
      t.integer :item_price,     null: false
      t.boolean :sales_status,   null: false, default: false

      t.timestamps
    end
  end
end
