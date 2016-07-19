module Applicants
  class SendInvitation
    include Interactor

    def call
      ids = context.ids

      raise ArgumentError, 'IDs must be specified' if ids.empty?

      applicants = Applicant.where(id: ids)
      applicants_with_emails = applicants.where('email IS NOT NULL AND email != ?', '')

      email_template = EmailTemplate.find_by_name('invitation')

      applicants_with_emails.each do |applicant|
        log = EmailSendingLog.create(status: 'queued', emailable: applicant)
        message_token = log.id.to_s

        ApplicantMailer.welcome_message(applicant, email_template, message_token).deliver
      end

      context.successful_recipients = applicants_with_emails.count
      context.all_recipients = applicants.count
    end
  end
end