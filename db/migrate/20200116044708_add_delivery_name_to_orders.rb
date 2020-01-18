class AddDeliveryNameToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :delivery_name, :string
    add_column :orders, :Delivery_address, :text
    add_column :orders, :Delivery_post, :integer
  end
end
