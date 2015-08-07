module Applicants
  class SendInvitation
    include Interactor

    def call
      ids = context.ids
      raise ArgumentError, 'IDs must be specified' if ids.empty?

      applicants = Applicant.where(id: ids)
      applicants_with_emails = applicants.where('email IS NOT NULL AND email != ?', '').
        select('first_name, last_name, email')

      applicants_with_emails.each do |applicant|
        ApplicantMailer.welcome_message(applicant).deliver
      end

      context.successful_recipients = applicants_with_emails.count
      context.all_recipients = applicants.count
    end
  end
end