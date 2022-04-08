class LogSerializer < ActiveModel::Serializer
  attributes :id

  attribute :appointment do
    object.appointment
  end
  attribute :status_change_by do
    object.admin
  end
end
