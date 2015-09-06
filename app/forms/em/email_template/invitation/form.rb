module EM
  module EmailTemplate
    module Invitation
      class Form < Base
        attribute :data, ValueObjects::Invitation, default: ValueObjects::Invitation.new
        attribute :name, String
        attribute :email_template, EmailTemplate

        private

        def persist!
          email_template.data.deep_merge!(data.attributes)
          email_template.save
        end
      end
    end
  end
end
