class CreateProductImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_images do |t|
      t.integer :product_id
      t.string :file
      t.boolean :is_default
      t.timestamps
    end
  end
end
