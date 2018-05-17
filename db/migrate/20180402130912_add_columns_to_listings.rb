class AddColumnsToListings < ActiveRecord::Migration[5.1]
  def change
  	change_table :listings do |t|
 		t.belongs_to :user
 	end
 end
end