class Post < ApplicationRecord
  include PostMethods
  
  belongs_to :user
 
  has_many_attached :post_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_likes 

  scope :posts_for_home_page, -> (arr){ where(user_id: arr).order(created_at: :desc)}
  scope :posts_for_current_user, -> (id){where(user_id: id).order(created_at: :desc)}

  validate :post_content, :post_images_type

  private
  def post_content
    if !(post_images.attached?) && (text.blank?)
      errors.add(:post, "can't be blank")
    end
  end

  def post_images_type
    if post_images.attached? 
      post_images.each do |image|
        unless image.content_type.in?(%("image/jpg" "image/jpeg" "image/png"))
          errors.add(:post_images, "only JPEG or PNG files are allowed!!")
        end
      end
    end
    
  end

end