class UsersController < Clearance::UsersController
	#before action, needs to be logged in, except for sign up
	before_action :require_login, except: :create

	def create
	    @user = User.new(allowed_params)

	    if @user.save
	      sign_in @user

	      redirect_to user_path(@user)
	    else
	    	@errors = @user.errors.full_messages
	      render template: "users/new"
	    end
	end

	
	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end


	def update
	@user = User.find(params[:id])
		if @user.update_attributes(allowed_params)
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	def reservations
		@reservations = current_user.reservations
	end


	private
	def allowed_params
		params.require(:user).permit(:email, :password, :first_name, :last_name, :birthday, :gender, :phone,
			:about_me, :avatar)
	end

	def require_login
		if !current_user
			redirect_to root_path
		end
	end

end


