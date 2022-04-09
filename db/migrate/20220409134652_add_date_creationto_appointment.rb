class AddDateCreationtoAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :booked_date, :datetime
  end
end
