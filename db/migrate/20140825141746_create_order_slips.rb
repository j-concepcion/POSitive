class CreateOrderSlips < ActiveRecord::Migration
  def change
    create_table :order_slips, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.string :order_type
      t.integer :table_number
      t.integer :takeout_number
      t.integer :quantity

      t.timestamps
    end
  end
end
