class AddName1ToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :name1, :string
    add_column :end_users, :name2, :string
    add_column :end_users, :name3, :string
    add_column :end_users, :name4, :string
    add_column :end_users, :address, :text
    add_column :end_users, :post, :string
    add_column :end_users, :number, :string
    add_column :end_users, :withdraw, :datetime
  end
end
