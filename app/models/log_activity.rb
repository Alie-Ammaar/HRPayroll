class LogActivity < ActiveRecord::Base
  belongs_to :user

  scope :find_current_month_log_activity, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

  before_save :calculate_amount_of_log_activity

  def calculate_amount_of_log_activity
  	self.per_hour = self.user.per_hour
  	self.amount = self.per_hour * self.hours_worked
  end
end
