class Expense < ActiveRecord::Base
	belongs_to :user
	belongs_to :vendor
	belongs_to :category
	belongs_to :account

	monetize :amount_cents

	delegate :name, to: :account, prefix: true

end
