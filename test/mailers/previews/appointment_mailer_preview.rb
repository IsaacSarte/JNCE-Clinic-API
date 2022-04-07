class AppointmentMailerPreview < ActionMailer::Preview
  def status_changed
    AppointmentMailer.status_changed
  end
end
