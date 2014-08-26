class RemoveQuantityFromOrderSlips < ActiveRecord::Migration
  def change
    remove_column :order_slips, :quantity, :integer
  end
end
