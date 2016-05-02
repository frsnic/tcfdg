class AddPostsCountToCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :posts_count
    add_column :categories, :posts_count, :integer, default: 0

    Category.pluck(:id).each do |i|
      Category.reset_counters(i, :posts) # 全部重算一次
    end
  end
end
