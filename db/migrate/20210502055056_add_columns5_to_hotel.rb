class AddColumns5ToHotel < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :prefecture_code, :integer
    add_column :hotels, :prefecture_name, :string
  end
end
