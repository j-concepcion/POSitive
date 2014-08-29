json.array!(@market_food_inventories) do |market_food_inventory|
  json.extract! market_food_inventory, :id, :item_name, :quantity, :date_purchased
  json.url market_food_inventory_url(market_food_inventory, format: :json)
end
