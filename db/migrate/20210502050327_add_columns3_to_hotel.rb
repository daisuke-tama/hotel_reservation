class AddColumns3ToHotel < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :prefectures_name, :string
    add_column :hotels, :abc_name, :string
  end
end
