class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :logs, dependent: :destroy
  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
  validates :password, presence: true, length: { minimum: 6 }
  validates :name, presence: true
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
end
