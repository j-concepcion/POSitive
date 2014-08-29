class RemoveDatePurchasedFromMarketFoodInventory < ActiveRecord::Migration
  def change
    remove_column :market_food_inventories, :date_purchased, :date
  end
end
