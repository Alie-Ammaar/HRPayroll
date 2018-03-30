class CreatePayrollSettings < ActiveRecord::Migration
  def change
    create_table :payroll_settings do |t|
      t.float :tax

      t.timestamps null: false
    end
  end
end
