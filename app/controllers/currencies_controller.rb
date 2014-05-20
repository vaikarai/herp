class CurrenciesController < ApplicationController

		before_action :set_currency, only: [:show, :edit, :update, :destroy]
		before_action :set_account

	def index
		@currencies = current_user.currencies
	end

	def show
	end

	def new
		@currency = Currency.new
	end

	def create
		@currency = Currency.new(currency_params)
		@currency.account_id = params[:account_id]

		respond_to do |format|
			if @currency.save
				format.html { redirect_to user_account_currencies_path, notice: 'Currency was successfully created.' }
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
			if @currency.update(currency_params)
				format.html { redirect_to user_account_currencies_path, notice: 'Currency was successfully updated.' }
				format.js
			else
				format.html { render action: 'edit' }
				format.js
			end	
		end
	end

	def destroy
		@currency.destroy
		respond_to do |format|
			format.html { redirect_to user_account_currencies_path }
			format.js
		end
	end

private

	def currency_params
		params.require(:currency).permit(:name, :amount_cents, :account_id)
	end

	def set_currency
		@currency = Currency.find(params[:id])
	end

	def set_account
		@account = Account.find(params[:account_id])
	end

end
