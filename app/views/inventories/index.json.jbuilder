json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :item_name, :quantity, :buying_price, :selling_price, :date_purchased, :expiration_date, :waste_age
  json.url inventory_url(inventory, format: :json)
end
