class OrderSlip < ActiveRecord::Base
	has_many :order_slip_items, :dependent => :destroy
	accepts_nested_attributes_for :order_slip_items, allow_destroy: true, reject_if: lambda { |a| a[:product_id].blank? or a[:quantity].blank? }

	TYPES = ["Dine-In", "Takeout"]

	TABLES = ["1", "2", "3", "4", "5", "6", "7"]

	TAKEOUTS = ["Plastic", "Box"]

	validates :order_type, presence: true
	validates :table_number, uniqueness: true, if: Proc.new {|order_slip| order_slip.open? and order_slip.order_type=="Dine-In"}
	validates :takeout_number, uniqueness: true, if: Proc.new {|order_slip| order_slip.open? and order_slip.order_type=="Takeout"}

end
