class AddEmailableAddressToEmailSendingLog < ActiveRecord::Migration
  def change
    add_column :email_sending_logs, :emailable_address, :string

    add_index :email_sending_logs, :emailable_address
  end
end
