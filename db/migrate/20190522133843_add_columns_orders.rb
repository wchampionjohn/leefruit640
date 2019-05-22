class AddColumnsOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :delivered_at, :datetime
    add_column :orders, :shipped_at, :datetime
  end
end
