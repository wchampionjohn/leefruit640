class AddSeqToProductSpecs < ActiveRecord::Migration[5.1]
  def change
    add_column :product_specs, :seq, :integer
    add_index :product_specs, :seq
  end
end
