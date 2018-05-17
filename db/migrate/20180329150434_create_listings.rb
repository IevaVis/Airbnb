
class CreateListings < ActiveRecord::Migration[5.1]
  def change
  	create_table :listings do |t|
  		t.string :title
 		t.string :country
 		t.string :city
 		t.string :property_type
 		t.string :number_of_bedrooms
 		t.string :number_of_people
 		t.text :property_description
 		t.integer :price_per_day
    	t.boolean :smoker
    	t.boolean :pets_allowed
		end
	end	
end