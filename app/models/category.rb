class Category < ActiveRecord::Base
	has_many :expenses, through: :vendors
	has_many :vendors

end
