class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
