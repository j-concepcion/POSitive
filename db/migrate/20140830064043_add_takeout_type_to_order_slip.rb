class AddTakeoutTypeToOrderSlip < ActiveRecord::Migration
  def change
    add_column :order_slips, :takeout_type, :string
  end
end
