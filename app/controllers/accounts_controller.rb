class AccountsController < ApplicationController

	before_action :set_account, only: [:show, :edit, :update, :destroy]

	def index
		@accounts = current_user.accounts
	end

	def show
		@currencies = Currency.where(account_id: params[:id])
		respond_to do |format|
	        format.html
	        format.json { head :no_content }
	        format.js
  		end
	end

	def new
		@account = Account.new
	end

	def create
		@account = Account.new(account_params)
		@account.user_id = params[:user_id]

		respond_to do |format|
			if @account.save
				format.html { redirect_to user_accounts_path, notice: 'Account was successfully created.' }
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
			if @account.update(account_params)
				format.html { redirect_to user_accounts_path, notice: 'Account was successfully updated.' }
				format.js
			else
				format.html { render action: 'edit' }
				format.js
			end	
		end
	end

	def destroy
		@account.destroy
		respond_to do |format|
			format.html { redirect_to user_accounts_path }
			format.js
		end
	end

private

	def account_params
		params.require(:account).permit(:name, :description, :user_id)
	end

	def set_account
		@account = Account.find(params[:id])
	end

end
