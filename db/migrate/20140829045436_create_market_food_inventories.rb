class CreateMarketFoodInventories < ActiveRecord::Migration
  def change
    create_table :market_food_inventories, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.string :item_name
      t.integer :quantity
      t.date :date_purchased

      t.timestamps
    end
  end
end
