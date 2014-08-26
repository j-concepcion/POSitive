class AddServerToOrderSlip < ActiveRecord::Migration
  def change
    add_column :order_slips, :server, :string
  end
end
