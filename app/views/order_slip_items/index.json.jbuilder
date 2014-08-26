json.array!(@order_slip_items) do |order_slip_item|
  json.extract! order_slip_item, :id, :quantity
  json.url order_slip_item_url(order_slip_item, format: :json)
end
