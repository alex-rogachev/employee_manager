class AddUniqIndexToApplicantsVacancies < ActiveRecord::Migration
  def change
    add_index :applicants_vacancies, [:applicant_id, :vacancy_id], unique: true, name: 'by_applicant_and_vacancy'
  end
end
