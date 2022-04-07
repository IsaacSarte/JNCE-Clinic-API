class Log < ApplicationRecord
  belongs_to :appointment
  belongs_to :admin

  validates :message, presence: true
end
