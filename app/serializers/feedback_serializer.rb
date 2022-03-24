class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at

  attribute :user_profile do
    {
      data: {
        user_id: object.user.id,
        fullname: object.user.fullname,
        email: object.user.email,
        phone: object.user.phone
      }
    }
  end
end
