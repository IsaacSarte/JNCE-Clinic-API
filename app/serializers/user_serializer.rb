class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :email, :phone, :created_at

  attribute :user_feedback do
    object.feedbacks
  end
  attribute :appointment do
    object.appointments
  end
end
