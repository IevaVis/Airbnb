class ReservationsController < ApplicationController
	#before I can do new, create, show reservation, I have to be logged in
	before_action :require_login, only: [:new, :create, :show]

# taking in the listing user is seeing now and make a 
# reservation for that particular listing
	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = @listing.reservations.new
	end


	def create
		#this reservation belongs to current user
		@reservation = current_user.reservations.new(allowed_params)
		#only shows the existance of the listing. Listing_id comes from url
		@listing = Listing.find(params[:listing_id])
		#connects listing with reservation
		@reservation.listing_id = @listing.id
		#length of stay method defined in reservations model
		total_price = @listing.price_per_day * @reservation.length_of_stay
		@reservation.total_price = total_price
		
		if @reservation.save
			ReservationJob.perform_later(@reservation)
			# ReservationMailer.booking_email(@reservation).deliver_now
			redirect_to listing_reservation_path(@listing, @reservation)
		else
			flash[:notice] = ""
			@reservation.errors.each {|key,error| flash[:notice] += "#{key}: #{error}\n"}
			redirect_to new_listing_reservation_path(@listing)
		end
	end

	def show
		@listing = Listing.find(params[:listing_id])
		@reservation = current_user.reservations.find(params[:id])
	end




	private
	
	def allowed_params
		params.require(:reservation).permit(:start_date, :end_date)
	end

	def require_login
		if !current_user
			flash[:notice] = "You have to be signed in to continue!"
			redirect_to sign_in_path
		end
	end	
end
