class PopulateEmailableAddress < ActiveRecord::Migration
  def up
    EmailSendingLog.all.each { |log| log.update_attribute(:emailable_address, log.emailable.email) }
  end

  def down
    raise ActiveRecord::IrreversibleMigration, 'Can not revert migration'
  end
end
