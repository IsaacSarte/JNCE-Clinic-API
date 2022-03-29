class User < ApplicationRecord
  has_many :feedbacks, dependent: :destroy
  has_many :appointments, dependent: :destroy

  validates :fullname, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }
  validates :phone, presence: true
end
