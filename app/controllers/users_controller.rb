class UsersController < ApplicationController
	before_action :authorized_manager_and_admin, only: [:index]
	before_action :authorized_admin?, only: [:update, :edit, :new, :create]
	before_action :set_user, only: [:update, :destroy, :show ,:edit ] 
	def index
		@users = User.all
	end

	def show

		
	end

	def new
		@user = User.new	
	end

	def create
		@user = User.new(user_params)
		@user.date_joined = DateTime.now.utc
		if @user.save
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		byebug
		if params[:user][:password].blank?
			if @user.update_without_password(user_params)
				redirect_to user_path(@user)
			else
				render 'edit'
			end
		else
			if @user.update(user_params)
				redirect_to user_path(@user)
			else
				render 'edit'
			end
		end
	end


	private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :user_title, :first_name, :middle_name, 
			:surname, :gender, :dob, :ni_number, :address_1, :address_2, :address_3, 
			:postal_code, :city, :home_number, :mobile_number, :last_signed_in, :role_id,
			:passport_avatar, :job_title, :password_confirmation, :password )
	end
end
