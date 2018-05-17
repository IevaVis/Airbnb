class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  validate :date_available

def length_of_stay
  (self.end_date - self.start_date).to_i
end 


  private

  def date_available
  	if !start_date.nil? && !end_date.nil?
  		errors.add(:overlap ,"Date overlap") if self.listing.reservations.where("start_date < ? AND end_date > ?","#{end_date}", "#{start_date}").present?
  	end
  end
end