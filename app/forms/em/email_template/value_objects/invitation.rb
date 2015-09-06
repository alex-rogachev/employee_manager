module EM
  module EmailTemplate
    module ValueObjects
      class Invitation < ::EM::EmailTemplate::ValueObjects::Base
        values do
          attribute :vacancy, String
          attribute :vacancy_link, String
        end

        validates_presence_of :vacancy, :vacancy_link
      end
    end
  end
end