class CategoriesController < ApplicationController

	load_and_authorize_resource

	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all
	end

	def show
		@vendors = Vendor.where(category_id: params[:id])
		respond_to do |format|
	        format.html { render 'vendors/_vendor' }
	        format.json { head :no_content }
	        format.js
  		end
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		respond_to do |format|
	      if @category.save
	        format.html { redirect_to @category, notice: 'category was successfully created.' }
	        format.json { render action: 'show', status: :created, location: @category }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @category.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def edit
	end

	def update
		respond_to do |format|
	      if @category.update(category_params)
	        format.html { redirect_to @category, notice: 'category was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @category.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def destroy
		@category.destroy
    	respond_to do |format|
	      format.html { redirect_to categories_url }
	      format.json { head :no_content }
  		end
	end

private

	def category_params
		params.require(:category).permit(:category, :description, :id)
	end

	def set_category
		@category = Category.find(params[:id])
	end
	
end

