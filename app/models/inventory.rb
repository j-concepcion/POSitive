class Inventory < ActiveRecord::Base
	validates :item_name, :quantity, :date_purchased, presence: true
end
