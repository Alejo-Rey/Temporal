class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :day
      t.references :user, null: false, foreign_key: true
      t.references :function, null: false, foreign_key: true

      t.timestamps
    end
  end
end
