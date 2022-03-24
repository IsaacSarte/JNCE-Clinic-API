class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :email, :phone, :created_at
end
