class Product < ActiveRecord::Base
	belongs_to :order_slip_items
	
	validates :item_name, :category, :price, presence: true
	validates :item_name, uniqueness: true
end
