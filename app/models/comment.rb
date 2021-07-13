class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :post_likes
  has_many :comment_likes 

  validates :body, presence: true

end
