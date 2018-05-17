class ListingsController < ApplicationController
	before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
	before_action :check_owner, only: [:edit, :update, :destroy]

	

#list of listings
#will have a view page
	def index
		@listings = Listing.all
	end

#display form for new record
#will have a view page
	def new
		@listing = Listing.new
	end

#saves new record
#will save and redirect - no views
	def create
		@listing = current_user.listings.new(allowed_params)
		if params[:smoker]
			@listing.smoker = true
		else
			@listing.smoker = false
		end
		if params[:pets_allowed]
			@listing.pets_allowed = true
		else
			@listing.pets_allowed = false
		end
		if @listing.save
			redirect_to listings_path
		else
			render :new
		end
	end

#displays a record of individual instance
#will have a view page
#params[:id] comes from routes. when routes for listings are created, you can see  /listings/:id(.:format)
#when you run rake routes
	def show
		@listing = Listing.find(params[:id])
	end

#displays form for editing existing record
#will have template
	def edit
		@listing = Listing.find(params[:id])
	end


#saving the form
#saves and redirects
	def update
		@listing = Listing.find(params[:id])
		if @listing.update_attributes(allowed_params)
			redirect_to listing_path(@listing)
		else
			render :new
		end
	end

#deleting a record
#deletes and redirects listing

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy
		redirect_to root_url
	end


	private
	def allowed_params
		params.require(:listing).permit(:title, :country, :address, :property_type, :number_of_bedrooms, :number_of_people,
			:property_description, :price_per_day, {avatars: []})
	end

	def require_login
		if !current_user
			redirect_to root_path
		end
	end

	def check_owner
		@listing = Listing.find(params[:id])
		if @listing.user.id != current_user.id
			redirect_to listings_path
		end
	end


end




