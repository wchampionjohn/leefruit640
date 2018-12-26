class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.datetime :publish_date
      t.string :cover_photo
      t.integer :article_category_id

      t.timestamps
    end
  end
end
