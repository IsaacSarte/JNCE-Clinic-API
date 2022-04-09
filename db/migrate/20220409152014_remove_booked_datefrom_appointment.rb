class RemoveBookedDatefromAppointment < ActiveRecord::Migration[6.1]
  def change
    remove_column :appointments, :booked_date, :datetime
  end
end
