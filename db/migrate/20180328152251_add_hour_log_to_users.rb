class AddHourLogToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hour_log, :float, :boolean, default: 0.0
  end
end
