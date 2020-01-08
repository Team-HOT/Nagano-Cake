class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :end_user_id
      t.string :delivery_name1
      t.string :delivery_name2
      t.string :delivery_name3
      t.string :delivery_name4
      t.text :delivery_address
      t.string :delivery_post
      t.string :delivery_number
      t.string :payment

      t.timestamps
    end
  end
end
