class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.string :item_name
      t.string :category
      t.decimal :price

      t.timestamps
    end
  end
end
