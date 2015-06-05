class ApplicantMailer < ActionMailer::Base
  def welcome_message applicant
    @applicant = applicant

    mail subject: 'Welcome message',
         from: 'Swan Software Solutions <no-reply@swansoftwaresolutions.com>',
         to: 'rogachev-alex@yandex.ru',
         reply_to: ''
  end
end
