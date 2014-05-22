class VendorsController < ApplicationController

	before_action :set_vendor, only: [:show, :edit, :update, :destroy]
	before_action :set_category

	def index
		@vendors = @category.vendors
	end

	def show
	end

	def new
		@vendor = Vendor.new
	end

	def create
		@vendor = Vendor.new(vendor_params)
		@vendor.category_id = params[:category_id]

		respond_to do |format|
	      if @vendor.save
	        format.html { redirect_to category_vendors_path, notice: 'vendor was successfully created.' }
	        format.json { render action: 'show', status: :created, location: @vendor }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @vendor.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def edit
	end

	def update
		respond_to do |format|
	      if @vendor.update(vendor_params)
	        format.html { redirect_to category_vendors_path, notice: 'vendor was successfully updated.' }
	        @vendor.errors.add(:base, "Sorry We are booked for this slot")
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @vendor.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def destroy
		@vendor.destroy
    	respond_to do |format|
	      	format.html { redirect_to category_vendors_path }
	      	format.json { head :no_content }
  		end
	end

private

	def vendor_params
		params.require(:vendor).permit(:name, :address1, :address2, :city, :pincode, :country, :email, :business_phone, :extn, :category_id)
	end

	def set_vendor
		@vendor = Vendor.find(params[:id])
	end

	def set_category
		@category = Category.find(params[:category_id])
	end
end
 
