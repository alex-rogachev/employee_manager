class ApplicantMailer < ActionMailer::Base
  def welcome_message applicant
    @applicant = applicant

    mail subject: 'Glass Software Solutions',
         from: 'Natalia Ignatieva <recruiter.ignatieva@gmail.com>',
         to: 'rogachev-alex@yandex.ru',
         reply_to: 'recruiter.ignatieva@gmail.com'
  end
end
