class AppointmentMailer < ApplicationMailer
  def status_changed(email)
    mail(
      to: email,
      cc: Admin.where.not(id: 1).pluck(:email),
      subject: ENV['COMPANY_MAIL_SUBJECT']
    )
  end
end
