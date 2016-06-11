class InstaScrape::InstagramUser
  attr_accessor :username, :image, :post_count, :follower_count, :following_count, :description
  def initialize(username, image, post_count, follower_count, following_count, description)
    @username = username
    @image = image
    @post_count = post_count
    @follower_count = follower_count
    @following_count = following_count
    @description = description
  end
end
