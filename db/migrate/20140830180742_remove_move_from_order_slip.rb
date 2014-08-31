class RemoveMoveFromOrderSlip < ActiveRecord::Migration
  def change
    remove_column :order_slips, :move, :boolean
  end
end
