class ChangeOrderColumns < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :delivered_at, :date
    change_column :orders, :shipped_at, :date
  end
end
