class RemoveAppointmentToUser < ActiveRecord::Migration[6.1]
  def change
    remove_reference :appointments, :user, index: true, foreign_key: true
  end
end
