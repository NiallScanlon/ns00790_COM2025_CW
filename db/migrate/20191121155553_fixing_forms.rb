class FixingForms < ActiveRecord::Migration[5.2]
  def change

    remove_column :bookings, :date

    add_column :bookings, :date, :date
    add_column :bookings, :time, :time
  end
end
