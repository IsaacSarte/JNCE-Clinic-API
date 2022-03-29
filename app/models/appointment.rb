class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :schedule_date, presence: true
  validates :status, presence: true
end
