class AddRecipientEmailAddressToEmailSendingLog < ActiveRecord::Migration
  def change
    add_column :email_sending_logs, :recipient_email_address, :string
  end
end
