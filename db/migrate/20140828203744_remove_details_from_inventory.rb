class RemoveDetailsFromInventory < ActiveRecord::Migration
  def change
    remove_column :inventories, :buying_price, :decimal
    remove_column :inventories, :selling_price, :decimal
  end
end
