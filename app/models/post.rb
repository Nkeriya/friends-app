class Post < ApplicationRecord
  belongs_to :user
 
  has_many_attached :post_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_likes 

  scope :posts_for_home_page, -> (arr){ where(user_id: arr).order(created_at: :desc)}
  scope :posts_for_current_user, -> (id){where(user_id: id).order(created_at: :desc)} 
  # validate :post_content

  private
  def post_content
    unless post_images.attached? && !(text.blank?)
      errors[:base] << "Post can't be empty..."
    end
  end

end
