class AddColumnsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :area_id, :integer, after: :address
    add_column :orders, :city_id, :integer, after: :address
    add_column :orders, :user_id, :integer, after: :address
    rename_column :orders, :tel, :phone
  end
end
