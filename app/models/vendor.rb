class Vendor < ActiveRecord::Base
	has_many :expenses
	belongs_to :category

end
