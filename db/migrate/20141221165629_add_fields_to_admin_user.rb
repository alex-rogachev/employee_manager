class AddFieldsToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :admin, :boolean, default: false
    add_column :admin_users, :first_name, :string
    add_column :admin_users, :middle_name, :string
    add_column :admin_users, :last_name, :string
    add_column :admin_users, :birth_date, :date
    add_column :admin_users, :gender, :string
    add_column :admin_users, :phone_number, :string
  end
end
