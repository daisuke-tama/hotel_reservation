class AddColumns4ToHotel < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :prefecture_code, :integer
  end
end
