module PostMethods
  extend ActiveSupport::Concern
  
  def like_count
    posts_like = PostLike.where(post_id: self.id)
    return posts_like.count, posts_like
  end

end