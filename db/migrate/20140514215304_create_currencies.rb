class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|

      t.string :name
      t.integer :amount_cents
      t.belongs_to :account

      t.timestamps
    end
  end
end
