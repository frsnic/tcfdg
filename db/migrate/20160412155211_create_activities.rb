class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.string :link
      t.boolean :is_public
      t.datetime :start_at
      t.timestamps null: false
    end
  end
end
