class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column(:expenses, :purchase_date, :date)
  end
end
