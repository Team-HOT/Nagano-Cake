class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :end_user_id
      t.string :name1
      t.string :name2
      t.string :neme3
      t.string :name4
      t.string :order_delivery_name
      t.text :order_delivery_address
      t.integer :order_delivery_post
      t.string :order_item
      t.integer :order_price
      t.integer :order_quantity
      t.integer :order_postage
      t.integer :order_total_price
      t.string :order_payment

      t.timestamps
    end
  end
end
