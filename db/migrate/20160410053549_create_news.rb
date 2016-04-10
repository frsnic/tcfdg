class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :link
      t.datetime :posted_at
      t.timestamps null: false
    end
  end
end
