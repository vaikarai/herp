class ChangePhoneToTextColumn < ActiveRecord::Migration
  def change
  	change_column(:users, :home_phone, :string)
  	change_column(:users, :cell_phone, :string)
  end
end
