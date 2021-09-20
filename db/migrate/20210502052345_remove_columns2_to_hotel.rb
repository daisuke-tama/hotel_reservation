class RemoveColumns2ToHotel < ActiveRecord::Migration[5.2]
  def change
    remove_column :hotels, :prefecture, :string
  end
end
