class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :nickname
      t.date :birth_date
      t.string :gender
      t.string :post
      t.text :notes
      t.string :email
      t.string :phone_number
      t.float :experience
      t.string :area_of_expertise
      t.string :place_of_residence
      t.string :skype_address

      t.timestamps
    end
  end
end
