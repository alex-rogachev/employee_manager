class ApplicantMailer < ActionMailer::Base
  def welcome_message applicant, email_template
    @applicant = applicant
    @email_template = email_template

    mail subject: 'Glass Software Solutions',
         from: 'Natalia Ignatieva <recruiter.ignatieva@gmail.com>',
         to: applicant.email,
         reply_to: 'recruiter.ignatieva@gmail.com'
  end
end
