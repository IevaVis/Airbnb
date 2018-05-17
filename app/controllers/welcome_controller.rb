class WelcomeController < ApplicationController
	
	def index
		@listings = Listing.order("title ASC").page(params[:page]).per(6)
	end

end


