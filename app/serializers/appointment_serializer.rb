class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :schedule_date, :status
end
