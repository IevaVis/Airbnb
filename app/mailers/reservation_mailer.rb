class ReservationMailer < ApplicationMailer

	default from: "pairbnbproject@gmail.com"

	def booking_email(reservation)
		@customer = reservation.user
		@reservation = reservation
		@listing = reservation.listing
		host = @listing.user
		mail(to: host.email, subject: "Pairbnb Reservation")
	end

	
end
