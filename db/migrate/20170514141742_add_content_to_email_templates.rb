class AddContentToEmailTemplates < ActiveRecord::Migration
  def change
    add_column :email_templates, :content, :text
  end
end
