class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :end_user_id
      t.integer :quentity

      t.timestamps
    end
  end
end
