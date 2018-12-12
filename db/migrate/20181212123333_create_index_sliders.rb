class CreateIndexSliders < ActiveRecord::Migration[5.1]
  def change
    create_table :index_sliders do |t|
      t.string :title
      t.string :link
      t.string :image
      t.string :sub_title
      t.boolean :is_active

      t.timestamps
    end
  end
end
