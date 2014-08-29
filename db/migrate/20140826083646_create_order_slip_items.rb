class CreateOrderSlipItems < ActiveRecord::Migration
  def change
    create_table :order_slip_items, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
