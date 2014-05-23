class UsersController < ApplicationController

  #load_and_authorize_resource

  before_action :set_user, only: [:edit, :update, :destroy]
  skip_before_filter :require_login, only: [:index, :new, :create]

  def index
    @users = User.all
  end

  def show        
    @balance = current_user.calc_budget_balance
    @monthly_expenses = current_user.calc_monthly_total_expenses
    @yearly_expenses = current_user.calc_yearly_total_expenses
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to current_user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: current_user }
      else
        format.html { render action: 'new' }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to current_user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def reports
    search_expense_by_category
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def set_account
    @account = Account.find(params[:expense][:account_id])
    @currencies = @account.currencies.where(name: "CAD")
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address1, :address2, :city, :pincode, :country, :email, :password, :password_confirmation, :preference, :home_phone, :cell_phone, :birth_date)
  end

  def search_expense_by_category
      @categories = Category.where("category iLIKE ?","%#{params[:search]}%")
      if @categories.length > 1
        @search=nil
      else
        @search = Expense.where(category_id: @categories.first.id).all
      end
  end
end
