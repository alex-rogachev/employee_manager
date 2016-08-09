class Vacancy < ActiveRecord::Base
  has_and_belongs_to_many :applicants

  attr_accessible :description, :level, :technology

  validates_presence_of :level, :technology
end
