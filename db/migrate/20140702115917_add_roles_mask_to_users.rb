class AddRolesMaskToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roles_mask, :integer, default: 0
    add_index :users, :roles_mask
  end
end
