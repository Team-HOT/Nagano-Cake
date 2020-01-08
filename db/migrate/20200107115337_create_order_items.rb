class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :order_item_price
      t.string :order_item_name
      t.string :production_status

      t.timestamps
    end
  end
end
