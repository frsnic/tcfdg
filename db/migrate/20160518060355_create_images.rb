class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :post
      t.integer :picture_id
      t.timestamps null: false
    end
  end
end
