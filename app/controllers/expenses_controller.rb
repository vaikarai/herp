class ExpensesController < ApplicationController

	before_action :set_currency, only: [:create]	
	before_action :set_expense, only: [:show, :edit, :update, :destroy]

	def index
		@expenses = Expense.all
	end

	def show
	end

	def new
	 	@expense = current_user.expenses.build
	end

	def create
		@expense = Expense.new(expense_params)
		update_account_balance
		respond_to do |format|
			if @expense.save
				format.html {redirect_to user_path(@user), notice: "expense created successfully"}
				format.js 
			else
				format.html {render :show}
				format.js
			end
		end
	end

	def edit
	end

	def update
		debugger
		respond_to do |format|
	      if @expense.update(expense_params)
	        format.html { redirect_to user_reports_search_path, notice: 'Expense was successfully updated.' }
	        format.js
	      else
	        format.html { render action: 'edit' }
	        format.js
	      end
    	end
	end

	def destroy
		@expense.destroy
	    respond_to do |format|
		    format.html { redirect_to user_reports_search_path }
		    format.js
  		end
	end

private

	def expense_params
		params[:expense][:amount_cents]=((params[:expense][:amount_cents].to_f)*100).to_i
		params.require(:expense).permit(:paid_by, :amount_cents, :purchase_date, :vendor_id, :category_id, :account_id, :user_id)
	end

	def set_expense
		@expense = Expense.find(params[:id])
	end

	def set_currency
		@currency = Currency.find(params[:expense][:currency_id])
	end

	def update_account_balance
		@currency.amount_cents = @currency.amount_cents - params[:expense][:amount_cents].to_i
		@currency.save
	end

	def update_account_balance_delete
		@currency.amount_cents = @currency.amount_cents - params[:expense][:amount_cents].to_i
		@currency.save
	end
end
