class Currency < ActiveRecord::Base
	belongs_to :account

	monetize :amount_cents

	# Currency.find(12)
	# Currency.cad
	def self.cad
		self.where("name = ?", "CAD").first
	end

	# @currency.is_cad?
	# def is_cad?
	# 	self.name == "CAD"
	# end

end
