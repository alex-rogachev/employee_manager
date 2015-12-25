class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.string :address
      t.integer :emailable_id
      t.string :emailable_type

      t.timestamps
    end
  end
end
