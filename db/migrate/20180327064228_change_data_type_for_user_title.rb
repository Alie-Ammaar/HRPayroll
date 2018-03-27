class ChangeDataTypeForUserTitle < ActiveRecord::Migration
  def change
  	change_column :users, :user_title, 'integer USING CAST(user_title AS integer)'
  end
end
