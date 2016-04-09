class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.integer :category_id
      t.datetime :posted_at
      t.text :content
      t.string :title
      t.string :excerpt
      t.string :status
      t.string :comment_status
      t.string :ping_status
      t.string :password
      t.string :handle
      t.string :post_type
      t.string :mime_type
      t.integer :comment_count
      t.timestamps null: false
    end
    add_index :posts, :author_id
    add_index :posts, :category_id
  end
end
