class IncreaseEmailTemplateDataSize < ActiveRecord::Migration
  def change
    change_column :email_templates, :data, :text, limit: 1073741823
  end
end
