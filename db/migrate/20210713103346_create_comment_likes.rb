class CreateCommentLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_likes do |t|
      t.references :user, foreign_key: true, index: true
      t.references :comment, foreign_key: true, index: true

      t.timestamps
    end
  end
end
