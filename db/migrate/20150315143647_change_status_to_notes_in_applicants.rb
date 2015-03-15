class ChangeStatusToNotesInApplicants < ActiveRecord::Migration
  def change
    rename_column :applicants, :status, :notes
    change_column :applicants, :notes, :text
  end
end
