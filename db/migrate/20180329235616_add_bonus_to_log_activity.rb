class AddBonusToLogActivity < ActiveRecord::Migration
  def change
    add_column :log_activities, :bonus, :float, :boolean, default: 0.0
  end
end
