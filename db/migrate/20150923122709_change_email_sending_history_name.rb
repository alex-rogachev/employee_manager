class ChangeEmailSendingHistoryName < ActiveRecord::Migration
  def change
    rename_table :email_sending_histories, :email_sending_logs
  end
end
