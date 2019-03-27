class ChgnageProductIdOnOrderItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :order_items, :product_id, :product_spec_id
  end
end
