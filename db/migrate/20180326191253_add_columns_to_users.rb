class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_title, :integer
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :surname, :string
    add_column :users, :gender, :integer
    add_column :users, :dob, :datetime
    add_column :users, :ni_number, :string
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :address_3, :string
    add_column :users, :postal_code, :string
    add_column :users, :city, :string
    add_column :users, :home_number, :string
    add_column :users, :mobile_number, :string
    add_column :users, :last_signed_in, :datetime
    add_column :users, :role_id, :integer
    add_column :users, :date_joined, :datetime
    add_column :users, :date_left, :datetime
    add_column :users, :passport_avatar, :string
    add_column :users, :job_title, :string
  end
end
