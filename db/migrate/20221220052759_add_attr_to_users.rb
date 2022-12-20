class AddAttrToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :city, :string
    add_column :users, :university, :string
    add_column :users, :school, :string
  end
end
