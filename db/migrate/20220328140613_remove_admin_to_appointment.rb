class RemoveAdminToAppointment < ActiveRecord::Migration[6.1]
  def change
    remove_reference :appointments, :admin, index: true, foreign_key: true
  end
end
