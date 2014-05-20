class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :pincode
      t.string :country     
      t.string :email
      t.string :password_digest
      t.string :preference
      t.integer :home_phone
      t.integer :cell_phone
      t.datetime :birth_date

      t.timestamps
    end
  end
end
