class CreateApplicantsVacancies < ActiveRecord::Migration
  def change
    create_table :applicants_vacancies, id: false do |t|
      t.integer :applicant_id
      t.integer :vacancy_id
    end
  end
end
