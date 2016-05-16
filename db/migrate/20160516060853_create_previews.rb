class CreatePreviews < ActiveRecord::Migration
  def change
    create_table :previews do |t|
      t.integer :user_id
      t.datetime :posted_at
      t.string :title
      t.text :content
      t.string :token
      t.timestamps null: false
    end
    add_index :previews, :user_id
  end
end
