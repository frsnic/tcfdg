class RemovePostTypeFromPosts < ActiveRecord::Migration
  def change
    Post.where.not(post_type: 'post').delete_all
    remove_column :posts, :post_type
  end
end
