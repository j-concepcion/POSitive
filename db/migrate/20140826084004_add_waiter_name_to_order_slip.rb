class AddWaiterNameToOrderSlip < ActiveRecord::Migration
  def change
    add_column :order_slips, :waiter_name, :string
  end
end
