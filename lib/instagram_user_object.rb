class InstagramUserObject
  attr_accessor :image, :post_count, :follower_count
  def initialize(image, post_count, follower_count)
    @image = image
    @post_count = post_count
    @follower_count = follower_count
  end
end
