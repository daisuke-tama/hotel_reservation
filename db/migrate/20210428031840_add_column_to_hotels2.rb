class AddColumnToHotels2 < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :image, :string
  end
end
