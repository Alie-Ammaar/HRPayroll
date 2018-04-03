class AddPerHourToUsers < ActiveRecord::Migration
  def change
    add_column :users, :per_hour, :float, :boolean, default: 0.0
  end
end
