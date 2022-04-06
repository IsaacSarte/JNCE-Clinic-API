class User < ApplicationRecord
  has_many :feedbacks, dependent: :destroy
  validates :fullname, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }
  validates :phone, presence: true, length: { minimum: 11, maximum: 11 }
end
