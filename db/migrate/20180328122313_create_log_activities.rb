class CreateLogActivities < ActiveRecord::Migration
  def change
    create_table :log_activities do |t|
      t.float :per_hour
      t.float :amount
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
