class CreateCategoryPosts < ActiveRecord::Migration
  def change
    create_table :category_posts do |t|
      t.integer :category_id
      t.integer :post_id
    end
    add_index :category_posts, :category_id
    add_index :category_posts, :post_id
    add_index :category_posts, [:category_id, :post_id]
  end
end
