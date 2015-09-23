module Applicants
  class SendInvitation
    include Interactor

    def call
      ids = context.ids

      raise ArgumentError, 'IDs must be specified' if ids.empty?
      raise ArgumentError, 'User id must be specified' if user_id.nil?

      applicants = Applicant.where(id: ids)
      applicants_with_emails = applicants.where('email IS NOT NULL AND email != ?', '')

      email_template = EmailTemplate.find_by_name('invitation')

      applicants_with_emails.each do |applicant|
        ApplicantMailer.welcome_message(applicant, email_template).deliver
      end

      context.successful_recipients = applicants_with_emails.count
      context.all_recipients = applicants.count
    end
  end
end