class CreateEmailSendingHistories < ActiveRecord::Migration
  def change
    create_table :email_sending_histories do |t|
      t.string :name
      t.integer :sent_by
      t.references :emailable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
