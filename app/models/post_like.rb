class PostLike < ApplicationRecord
  include PostMethods
  
  belongs_to :user
  belongs_to :post
end
