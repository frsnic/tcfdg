class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.integer :post_id
      t.integer :tag_id
      t.timestamps null: false
    end
    add_index :post_tags, :post_id
    add_index :post_tags, :tag_id
    add_index :post_tags, [:post_id, :tag_id]
  end
end
