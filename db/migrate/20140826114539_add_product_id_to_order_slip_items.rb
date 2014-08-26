class AddProductIdToOrderSlipItems < ActiveRecord::Migration
  def change
    add_column :order_slip_items, :product_id, :uuid
  end
end
