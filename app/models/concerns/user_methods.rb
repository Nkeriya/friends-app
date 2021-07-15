module UserMethods
  extend ActiveSupport::Concern

  def name
    name = (self.firstname.capitalize + " " + self.lastname.capitalize)
  end

  def friend_ids
    (self.friends + self.inverse_friends).pluck(:id)
  end

  def post_liked?(post_id)
    ids = self.post_likes.pluck(:post_id)
    
    if ids.include?(post_id)
      like_id = PostLike.find_by(post_id: post_id, user_id: self.id)
      return true,like_id 
    end
    return false    
  end

  def comment_liked?(comment_id)
    ids = self.comment_likes.pluck(:comment_id)
    
    if ids.include?(comment_id)
      like_id = CommentLike.find_by(comment_id: comment_id, user_id: self.id)
      return true,like_id 
    end
    return false    
  end

end