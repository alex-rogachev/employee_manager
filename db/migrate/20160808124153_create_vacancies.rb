class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :description
      t.string :level

      t.timestamps
    end
  end
end
