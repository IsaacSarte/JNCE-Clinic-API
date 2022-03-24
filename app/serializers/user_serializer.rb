class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :email, :phone, :created_at
  # has_many :feedbacks

  attribute :user_feedback do
    object.feedbacks
  end
end
