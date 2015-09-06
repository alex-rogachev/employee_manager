module EM
  module EmailTemplate
    module ValueObjects
      class ::EM::EmailTemplate::ValueObjects::Base < ::FormObject::Values
        def model_name
          ActiveModel::Name.new(self, nil, 'EmailTemplate')
        end

        def self.model_name
          ActiveModel::Name.new(self, nil, 'EmailTemplate')
        end
      end
    end
  end
end