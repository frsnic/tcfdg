class DropUpdatedAtAnd < ActiveRecord::Migration
  def change
    remove_column :post_tags, :created_at
    remove_column :post_tags, :updated_at
  end
end
