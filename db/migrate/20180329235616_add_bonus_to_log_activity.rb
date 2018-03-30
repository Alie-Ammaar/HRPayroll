class AddBonusToLogActivity < ActiveRecord::Migration
  def change
    add_column :log_activities, :bonus, :float
  end
end
