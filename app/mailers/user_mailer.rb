class UserMailer < ApplicationMailer
	def sample_email(user)
		@user = user
		mail(to: @user.email, subject: 'Sample Email')
  end
  
  def new_user_creation_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'Welcome to Payroll Management System')
  	
  end
end
