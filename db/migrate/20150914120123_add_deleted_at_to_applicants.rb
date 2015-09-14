class AddDeletedAtToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :deleted_at, :datetime
    add_index :applicants, :deleted_at
  end
end
