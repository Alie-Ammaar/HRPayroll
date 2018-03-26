class ApplicationController < ActionController::Base

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :authenticate_user!

	layout :layout_by_resource

	def layout_by_resource
		if devise_controller?
			"devise_layout"
		else
			"application"
		end
	end

	protected 
	def after_sign_in_path_for(resource)
		
		if resource.is_admin? || resource.is_manager?
			users_path
		else 
			user_path(resource)
		end
	end
	
end
