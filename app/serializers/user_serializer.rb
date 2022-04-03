class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :email, :phone, :created_at

  attribute :feedback do
    object.feedbacks
  end
end
