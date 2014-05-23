class User < ActiveRecord::Base
	authenticates_with_sorcery!

	has_many :accounts
	has_many :budgets
	has_many :vendors, through: :expenses
	has_many :expenses, through: :accounts
	has_many :currencies, through: :accounts

	  validates :password, length: { minimum: 3 }
	  validates :password, confirmation: true
	  validates :password_confirmation, presence: true
	  validates :email, uniqueness: true

  	def calc_budget_balance
	    begin_date = Time.now.beginning_of_month.to_date
	    end_date = Time.now.to_date
	    monthly_expenses = expenses.where('purchase_date BETWEEN ? AND ?',begin_date, end_date).sum(:amount_cents)
	    budget = budgets.where(budget_month: begin_date).first.amount_cents
	    ((budget - monthly_expenses)/100)
  	end

  	def calc_monthly_total_expenses
	    begin_date = Time.now.beginning_of_month.to_date
	    end_date = Time.now.to_date
	    monthly_expenses = (expenses.where('purchase_date BETWEEN ? AND ?',begin_date, end_date).sum(:amount_cents))/100
  	end

  	  def calc_yearly_total_expenses
	    begin_date = Time.now.beginning_of_year.to_date
	    end_date = Time.now.to_date
	    yearly_expenses = (expenses.where('purchase_date BETWEEN ? AND ?',begin_date, end_date).sum(:amount_cents))/100
  	end

end
