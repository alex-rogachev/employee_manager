class ChangeExperienceToDecimalInApplicants < ActiveRecord::Migration
  def change
    change_column :applicants, :experience, 'float USING CAST(experience AS float)'
  end
end
