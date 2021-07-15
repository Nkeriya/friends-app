module CommentMethods
  extend ActiveSupport::Concern
  
  def like_count
    comments_like = CommentLike.where(comment_id: self.id)
    return comments_like.count, comments_like
  end

end