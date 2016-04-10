class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :handle
      t.integer :parent_id
      t.timestamps null: false
    end
    add_index :categories, :parent_id
  end
end
