class AddMainPictureIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :main_picture_id, :integer
  end
end
