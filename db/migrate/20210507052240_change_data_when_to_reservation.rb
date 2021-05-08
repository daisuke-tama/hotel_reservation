class ChangeDataWhenToReservation < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :when_to, :date
  end
end
