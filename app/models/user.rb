class User < ApplicationRecord
    validates :fullname, presence: true
    validates :email, presence: true
    validates :phone, presence: true
end
