class UsersController < ApplicationController
	before_action :set_user, only: [:update, :destroy, :show ,:edit ] 
	def index
		@users = User.all
	end

	def show

		
	end

	private
	def set_user
		@user = User.find(params[:id])
		
	end
end