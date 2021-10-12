class Comment < ApplicationRecord
  include CommentMethods

  belongs_to :user
  belongs_to :post

  has_many :post_likes, dependent: :destroy
  has_many :comment_likes, dependent: :destroy

  validates :body, presence: true
end
