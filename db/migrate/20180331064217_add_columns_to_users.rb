
class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
  	change_table :users do |t|
 		t.string :first_name
 		t.string :last_name
 		t.string :birthday
 		t.string :gender
 		t.string :phone
 		t.text :about_me
		end
	end	
end
