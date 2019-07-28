class AddDeliveyWayToOrOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :delivery_way, :integer, limit: 2
    add_index :orders, :delivery_way
  end
end
