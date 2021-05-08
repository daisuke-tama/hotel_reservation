class AddColumns2ToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :ruby, :string
    add_column :users, :tel, :integer
  end
end
