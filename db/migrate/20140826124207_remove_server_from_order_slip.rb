class RemoveServerFromOrderSlip < ActiveRecord::Migration
  def change
    remove_column :order_slips, :server, :string
  end
end
