class AddOrderSlipIdToOrderSlipItems < ActiveRecord::Migration
  def change
    add_column :order_slip_items, :order_slip_id, :uuid
  end
end
