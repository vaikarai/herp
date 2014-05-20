class AddBelongsToVendor < ActiveRecord::Migration
  def change
  	rename_column(:expenses, :expense_type_id, :category_id)
  	add_column(:vendors, :category_id, :integer)
  end
end
