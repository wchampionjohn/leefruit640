class CreateProductSpecs < ActiveRecord::Migration[5.1]
  def change
    create_table :product_specs do |t|
      t.integer :product_id
      t.string :title
      t.integer :price
      t.integer :amount

      t.timestamps
    end
  end
end
