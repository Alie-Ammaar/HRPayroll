class LogActivitiesController < ApplicationController
	 before_action :set_log_activity, only: [:update, :destroy, :show ,:edit ] 

	def create
		@log_activity = LogActivity.new(log_activity_params)
		if @log_activity.save
			redirect_to user_path(@log_activity.user)
		end
	end

	def new
		@log_activity = LogActivity.new()
	end

	def update
		if	@log_activity.update(log_activity_params)
			redirect_to user_path(@log_activity.user)
		end
	end

	private
	def set_log_activity
		@log_activity = LogActivity.find(params[:id])	
	end

	def log_activity_params
		params.require(:log_activity).permit(:hours_worked, :amount, :per_hour, :user_id)
		
	end

end
