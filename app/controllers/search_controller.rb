class SearchController < ApplicationController

	def index
		@listings = Listing.country(params[:search]) if params[:search].present?
		@listings = @listings.smoker if params[:smoker].present?
		@listings = @listings.pets_allowed if params[:pets_allowed].present?
		respond_to do |format|
			format.html { 
				@listings = @listings.page(params[:page]).per(6)
				render "index"
			}
			format.json { render json: @listings }
				
		end
	end

end