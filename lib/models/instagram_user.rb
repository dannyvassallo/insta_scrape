class InstagramUser
  attr_accessor :image, :post_count, :follower_count, :following_count
  def initialize(image, post_count, follower_count, following_count)
    @image = image
    @post_count = post_count
    @follower_count = follower_count
    @following_count = following_count
  end
end
