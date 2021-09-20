class RemoveColumns4ToHotel < ActiveRecord::Migration[5.2]
  def change
    remove_column :hotels, :prefecture_code, :integer
  end
end
