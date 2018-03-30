class AddPerHourToUsers < ActiveRecord::Migration
  def change
    add_column :users, :per_hour, :float
  end
end
