class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t| 
     
      t.date :budget_month
      t.integer :amount_cents
      t.belongs_to :user

      t.timestamps
    end
  end
end
