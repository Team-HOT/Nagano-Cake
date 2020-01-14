class AddProductCategoryStatusToProductCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :product_categories, :product_category_status, :string
  end
end
