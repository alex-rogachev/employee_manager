class VacancyDecorator < ApplicationDecorator
  include ApplicationHelper
  delegate_all

  def title
    "#{format_value self, :technology, type: 'AreaOfExpertise'} #{format_value self, :level, type: 'Levels'}"
  end
end
