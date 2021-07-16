class CommentLike < ApplicationRecord
  include CommentMethods

  belongs_to :user
  belongs_to :comment
end
