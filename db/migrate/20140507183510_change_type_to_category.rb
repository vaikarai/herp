class ChangeTypeToCategory < ActiveRecord::Migration
  def change
  	rename_column(:expense_types, :type, :category)
  end
end
