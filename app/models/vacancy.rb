class Vacancy < ActiveRecord::Base
  has_and_belongs_to_many :applicants

  validates_presence_of :level, :technology
end
