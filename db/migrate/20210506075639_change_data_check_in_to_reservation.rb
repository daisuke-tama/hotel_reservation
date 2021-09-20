class ChangeDataCheckInToReservation < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :check_in, :time
  end
end
