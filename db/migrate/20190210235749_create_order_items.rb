class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :order_id
      t.string  :state

      t.timestamps
    end
  end
end
