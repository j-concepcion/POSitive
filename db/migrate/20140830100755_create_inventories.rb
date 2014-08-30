class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.string :item_name
      t.integer :quantity
      t.string :inventory_type

      t.timestamps
    end
  end
end
