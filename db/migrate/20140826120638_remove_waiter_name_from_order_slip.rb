class RemoveWaiterNameFromOrderSlip < ActiveRecord::Migration
  def change
    remove_column :order_slips, :waiter_name, :string
  end
end
