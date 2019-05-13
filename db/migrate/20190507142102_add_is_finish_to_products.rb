class AddIsFinishToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :is_finish, :boolean
    add_column :products, :is_public, :boolean
  end
end
