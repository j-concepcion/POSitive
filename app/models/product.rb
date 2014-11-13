class Product < ActiveRecord::Base
	belongs_to :order_slip_items

	CATEGORIES = ["Silog", "Special", "Rice Topping", "Extra", "Drink", "Sandwich", "Noodles", "Classic"]

	validates :item_name, :category, :price, presence: true
	validates :item_name, uniqueness: true
	validates :price, :numericality => { :greater_than => 0 }
end
