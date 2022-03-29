class Service < ApplicationRecord
  has_one :appointment, dependent: :destroy
end
