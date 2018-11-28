class AddBaseColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, after: :email
    add_column :users, :address, :string, after: :email
    add_column :users, :phone, :string, after: :email
  end
end
