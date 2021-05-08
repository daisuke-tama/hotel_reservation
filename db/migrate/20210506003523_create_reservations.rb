class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :many_night
      t.integer :many_people
      t.integer :when_to
      t.integer :check_in
      t.integer :amount

      t.timestamps
    end
  end
end
