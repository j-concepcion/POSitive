class AddMoveToOrderSlip < ActiveRecord::Migration
  def change
    add_column :order_slips, :move, :boolean
  end
end
