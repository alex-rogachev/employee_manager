module Applicants
  class SendInvitation
    include Interactor
    include ActionView::Helpers::SanitizeHelper

    def call
      ids = context.ids

      context.fail!(error: 'IDs must be specified') if ids.empty?

      email_template_name = context.email_template_name
      email_template = EmailTemplate.find_by_name(email_template_name)
      template_content = email_template.content

      context.fail!(error: "#{email_template_name.humanize} template has empty content.") unless has_content?(template_content)

      template_content = template_content.html_safe

      applicants = Applicant.where(id: ids)
      applicants_with_emails = applicants.where('email IS NOT NULL AND email != ?', '')

      applicants_with_emails.each do |applicant|
        log = EmailSendingLog.create(status: 'queued', emailable: applicant, emailable_address: applicant.email)
        message_token = log.id.to_s

        ApplicantMailer.welcome_message(applicant, template_content, message_token).deliver
      end

      context.successful_recipients = applicants_with_emails.count
      context.all_recipients = applicants.count
    end

    private

    def has_content?(template_content)
      return false if template_content.nil?
      strip_tags(template_content).squish.gsub("&nbsp;", "").gsub("&#39;", "'").strip.present?
    end
  end
end