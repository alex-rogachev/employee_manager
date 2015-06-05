class CreateEmployeesOld < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :nickname
      t.date :birth_date
      t.string :gender
      t.string :post
      t.string :status
      t.string :email
      t.string :phone_number
      t.string :experience
      t.string :area_of_expertise
      t.string :place_of_residence

      t.timestamps
    end
  end
end
