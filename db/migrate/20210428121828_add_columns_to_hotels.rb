class AddColumnsToHotels < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :tel, :string
  end
end
