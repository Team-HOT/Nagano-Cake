class RemoveWithdrawFromEndUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :end_users, :withdraw, :datetime
  end
end
