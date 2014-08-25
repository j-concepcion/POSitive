class Product < ActiveRecord::Base
	validates :item_name, :category, :price, presence: true
	validates :item_name, uniqueness: true
end
