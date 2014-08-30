class OrderSlip < ActiveRecord::Base
	has_many :order_slip_items, :dependent => :destroy
	accepts_nested_attributes_for :order_slip_items, allow_destroy: true, reject_if: lambda { |a| a[:product_id].blank? or a[:quantity].blank? }

	TYPES = ["Dine-In", "Takeout"]

	TABLES = ["1", "2", "3", "4", "5", "6", "7"]

	TAKEOUTS = ["Plastic", "Box"]

	validates :order_type, :order_date, presence: true

end
