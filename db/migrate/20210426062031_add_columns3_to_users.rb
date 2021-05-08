class AddColumns3ToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :icon, :string
    add_column :users, :introduction, :text
  end
end
