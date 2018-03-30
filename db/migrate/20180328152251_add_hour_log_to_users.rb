class AddHourLogToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hour_log, :float
  end
end
