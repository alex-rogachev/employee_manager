class AddTechnologyToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :technology, :string
  end
end
