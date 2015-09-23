class AddStatusToEmailSendingLog < ActiveRecord::Migration
  def change
    add_column :email_sending_logs, :status, :string
  end
end
