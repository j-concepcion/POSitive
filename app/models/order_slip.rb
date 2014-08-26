class OrderSlip < ActiveRecord::Base
	has_many :order_slip_items, :dependent => :destroy
	accepts_nested_attributes_for :order_slip_items, allow_destroy: true, reject_if: lambda { |a| a[:content].blank? }

	TYPES = ["Dine-In", "Takeout"]

	validates :order_type, :order_date, presence: true

end
