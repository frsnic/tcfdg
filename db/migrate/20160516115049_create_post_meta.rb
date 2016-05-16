class CreatePostMeta < ActiveRecord::Migration
  def change
    create_table :post_meta do |t|
      t.references :post
      t.string :keywords
      t.string :description
      t.timestamps null: false
    end
    add_index :post_meta, :post_id
  end
end
