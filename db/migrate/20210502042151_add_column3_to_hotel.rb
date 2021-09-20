class AddColumn3ToHotel < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :prefecture, :string
  end
end
