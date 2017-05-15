class ApplicantMailer < ActionMailer::Base
  def welcome_message applicant, template_content, message_token
    @applicant = applicant
    @template_content =  template_content

    headers['Message-ID'] = message_token

    mail subject: 'Glass Software Solutions',
         from: 'Natalia Ignatieva <recruiter.ignatieva@gmail.com>',
         to: applicant.email,
         reply_to: 'recruiter.ignatieva@gmail.com'
  end
end
