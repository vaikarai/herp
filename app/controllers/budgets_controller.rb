class BudgetsController < ApplicationController

		before_action :set_budget, only: [:show, :edit, :update, :destroy]

	def index
		@budgets = current_user.budgets
	end

	def show
	end

	def new
		@budget = Budget.new
	end

	def create
		@budget = Budget.new(budget_params)
		@budget.user_id = params[:user_id]

		respond_to do |format|
			if @budget.save
				format.html { redirect_to user_budgets_path, notice: 'budget was successfully created.' }
				format.js
			else
				format.html { render action: 'new' }
				format.js
			end	
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @budget.update(budget_params)
				format.html { redirect_to user_budgets_path, notice: 'budget was successfully updated.' }
				format.js
			else
				format.html { render action: 'edit' }
				format.js
			end	
		end
	end

	def destroy
		@budget.destroy
		respond_to do |format|
			format.html { redirect_to user_budgets_path }
			format.js
		end
	end

private

	def budget_params
		params.require(:budget).permit(:budget_month, :amount_cents, :user_id)
	end

	def set_budget
		@budget = Budget.find(params[:id])
	end

end
