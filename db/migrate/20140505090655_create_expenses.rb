class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :paid_by    
      t.integer :amount_cents
      t.datetime :purchase_date
      t.belongs_to :user
      t.belongs_to :vendor
    	

      t.timestamps
    end
  end
end
