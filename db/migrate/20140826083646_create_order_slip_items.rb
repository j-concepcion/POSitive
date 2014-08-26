class CreateOrderSlipItems < ActiveRecord::Migration
  def change
    create_table :order_slip_items do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
