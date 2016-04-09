class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :name
      t.string :email
      t.string :url
      t.string :ip
      t.string :content
      t.boolean :approved
      t.string :agent
      t.string :comment_type
      t.integer :user_id
      t.timestamps null: false
    end
    add_index :comments, :post_id
    add_index :comments, :user_id
  end
end
