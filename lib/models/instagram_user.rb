class InstagramUser
  attr_accessor :image, :post_count, :follower_count, :following_count, :description
  def initialize(image, post_count, follower_count, following_count, description)
    @image = image
    @post_count = post_count
    @follower_count = follower_count
    @following_count = following_count
    @description = description
  end
end
