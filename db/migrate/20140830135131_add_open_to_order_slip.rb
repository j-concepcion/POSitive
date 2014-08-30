class AddOpenToOrderSlip < ActiveRecord::Migration
  def change
    add_column :order_slips, :open, :boolean, :default => true
  end
end
