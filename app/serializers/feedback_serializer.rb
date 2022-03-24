class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at
  # belongs_to :user

  attribute :user_profile do
    {
      user_id: object.user.id,
      fullname: object.user.fullname,
      email: object.user.email,
      phone: object.user.phone
    }
  end
end
