class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :pincode
      t.string :country
      t.string :email
      t.integer :business_phone
      t.integer :extn

      t.timestamps
    end
  end
end
