class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :area_id, :integer, after: :name
    add_column :users, :city_id, :integer, after: :name
  end
end
