class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :product_body
      t.string :product_image
      t.integer :product_category_id
      t.string :sale_status

      t.timestamps
    end
  end
end
