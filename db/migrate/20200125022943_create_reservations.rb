class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :start_date
      t.integer :end_date
      t.string :status

      t.timestamps
    end
  end
end
