class AddPostCountToTags < ActiveRecord::Migration
  def change
    add_column :tags, :posts_count, :integer, default: 0

    Tag.pluck(:id).each do |i|
      Tag.reset_counters(i, :posts) # 全部重算一次
    end
  end
end
