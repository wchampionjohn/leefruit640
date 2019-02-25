class AddProdcutSpecsImage < ActiveRecord::Migration[5.1]
  def change
    add_column :product_specs, :image, :string, after: :title
  end
end
