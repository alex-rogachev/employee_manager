class CreateApplicantsVacancies < ActiveRecord::Migration
  create_table :applicants_vacancies do |t|
    t.integer :applicant_id
    t.integer :vacancy_id

    t.timestamps
  end
end
