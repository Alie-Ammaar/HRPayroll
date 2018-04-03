class UserMailer < ApplicationMailer
	def sample_email(user)
		@user = user
		mail(to: @user.email, subject: 'Sample Email')
  end
  
  def new_user_creation_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'Welcome to Payroll Management System')
  	
  end

  def user_salary_slip_email(user, log_activity)
  	@user = user
  	@log_activity = log_activity
  	mail(to: @user.email, subject: 'Your Current Month Payslip')
  end
end
