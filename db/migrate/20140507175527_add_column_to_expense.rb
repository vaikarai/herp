class AddColumnToExpense < ActiveRecord::Migration
  def change
  	add_column(:expenses, :expense_type_id, :integer)
  	remove_column(:expense_types, :expense_id, :integer)
  end
end
