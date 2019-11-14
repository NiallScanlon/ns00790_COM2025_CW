class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :barber_id
      t.datetime :date
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
