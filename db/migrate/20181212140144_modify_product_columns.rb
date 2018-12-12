class ModifyProductColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :description_2, :string, after: :title
    add_column :products, :name, :string, after: :title
  end
end
