class ModifyAttributesOfAppointment < ActiveRecord::Migration[6.1]
  def change
    remove_column :appointments, :schedule_date, :datetime
    add_column :appointments, :fullname, :string
    add_column :appointments, :location, :string
    add_column :appointments, :start_datetime, :datetime
    add_column :appointments, :end_datetime, :datetime
  end
end
