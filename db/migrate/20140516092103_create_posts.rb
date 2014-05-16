class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :author, index: true
      t.string :name
      t.string :slug
      t.text :body
      t.string :image_url
      t.datetime :published_at

      t.timestamps
    end
  end
end
