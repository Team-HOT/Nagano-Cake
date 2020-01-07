class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :postage
      t.string :order_status
      t.integer :quantity
      t.integer :total_fee
      t.integer :end_user_id
      t.integer :delively_id

      t.timestamps
    end
  end
end
