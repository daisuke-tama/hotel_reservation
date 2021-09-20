class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :price
      t.string :place
      t.text :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
