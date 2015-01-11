class AddAttachmentResumeToEmployees < ActiveRecord::Migration
  def self.up
    change_table :employees do |t|
      t.attachment :resume
    end
  end

  def self.down
    remove_attachment :employees, :resume
  end
end
