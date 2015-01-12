class RenameEmployeeToApplicant < ActiveRecord::Migration
  def change
    rename_table :employees, :applicants
  end
end
