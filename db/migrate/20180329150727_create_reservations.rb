
class CreateReservations < ActiveRecord::Migration[5.1]
  def change
  	create_table :reservations do |t|
  		t.belongs_to :user, index: true
  		t.belongs_to :listing, index: true
 		t.date :start_date
 		t.date :end_date
 		t.integer :total_price
		end
	end	
end