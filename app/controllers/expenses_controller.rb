class ExpensesController < ApplicationController

	before_action :set_currency, only: [:create]	

	def index
		@expenses = Expense.all
	end

	def show
	end

	def new
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
		@expense = @product.expenses.update_attributes(params_expense)
		if @expense.save
			redirect_to product_path(@product)
		else
			render :edit
		end
	end

	def update
		respond_to do |format|
	      if @expense.update(expense_params)
	        format.html { redirect_to @vendor, notice: 'Expense was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @vendor.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def destroy
		@expense.destroy
	    respond_to do |format|
		    format.html { redirect_to vendors_url }
		    format.json { head :no_content }
  		end
	end

private

	def expense_params
		params.require(:expense).permit(:paid_by, :amount_cents, :purchase_date, :vendor_id, :category_id, :account_id, :user_id)
	end

	def set_currency
		@currency = Currency.find(params[:expense][:currency_id])
	end

	def update_account_balance
		@currency.amount_cents = @currency.amount_cents - params[:expense][:amount_cents].to_i
		@currency.save
	end
end
