class CreateBlogImages < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_images do |t|
      t.integer :blog_id
      t.string  :file

      t.timestamps
    end
  end
end
