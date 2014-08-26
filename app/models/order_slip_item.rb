class OrderSlipItem < ActiveRecord::Base
	has_many :products

	belongs_to :order_slip

	validates :quantity, presence: true
end
