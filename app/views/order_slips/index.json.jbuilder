json.array!(@order_slips) do |order_slip|
  json.extract! order_slip, :id, :order_type, :table_number, :takeout_number, :quantity
  json.url order_slip_url(order_slip, format: :json)
end
