class Appointment < ApplicationRecord
  belongs_to :service
  validates :status, presence: true
  validates :fullname, presence: true
  validates :title, presence: true
  validates :location, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
end
