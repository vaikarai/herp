class CreateExpenseTypes < ActiveRecord::Migration
  def change
    create_table :expense_types do |t|

    	t.string :type
    	t.string :description
    	t.belongs_to :expense
    	
      t.timestamps
    end
  end
end
