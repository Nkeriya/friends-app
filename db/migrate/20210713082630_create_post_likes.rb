class CreatePostLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_likes do |t|
      t.boolean :like, default: false
      t.references :user, foreign_key: true, index: true
      t.references :post, foreign_key: true, index: true

      t.timestamps
    end
  end
end
