class CommentLike < ApplicationRecord
  include CommentMethods
  include UserMethods
  
  belongs_to :user
  belongs_to :comment
end
