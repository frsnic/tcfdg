class AddPostCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :posts_count, :integer, default: 0

    User.pluck(:id).each do |i|
      User.reset_counters(i, :posts) # 全部重算一次
    end
  end
end
