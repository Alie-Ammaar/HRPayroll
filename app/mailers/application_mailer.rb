class ApplicationMailer < ActionMailer::Base
  default from: "super_admin@payroll.com"
  layout 'mailer'
end
