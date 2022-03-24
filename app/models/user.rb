class User < ApplicationRecord
  has_many :feedbacks, dependent: :destroy

  validates :fullname, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
