class AddSgIdToEmailSendingLog < ActiveRecord::Migration
  def change
    add_column :email_sending_logs, :sg_id, :string
  end
end
