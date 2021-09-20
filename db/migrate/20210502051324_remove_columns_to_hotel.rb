class RemoveColumnsToHotel < ActiveRecord::Migration[5.2]
  def change
    remove_column :hotels, :place, :string
    remove_column :hotels, :prefecture_code, :integer
    remove_column :hotels, :prefecture_name, :string
    remove_column :hotels, :abc_name, :string
  end
end
