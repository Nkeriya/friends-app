class RemoveLikeFromPostLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_likes, :like
  end
end
