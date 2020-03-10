class ChangeDateColumnsToBookings < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :start_time, :start_date
    rename_column :bookings, :end_time, :end_date
  end
end
