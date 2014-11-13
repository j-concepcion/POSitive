class OrderSlipItem < ActiveRecord::Base
	has_many :products

	belongs_to :order_slip

	validates :quantity,  :numericality => { :greater_than => 0 }, presence: true
end
