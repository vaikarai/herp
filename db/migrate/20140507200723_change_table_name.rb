class ChangeTableName < ActiveRecord::Migration
  def change
  	rename_table(:expense_types, :categories)
  	remove_column(:expenses, :paid_by, :string)
  end
end
