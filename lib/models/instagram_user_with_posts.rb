class InstaScrape::InstagramUserWithPosts
  attr_accessor :username, :image, :post_count, :follower_count, :following_count, :description, :posts
  def initialize(username, image, post_count, follower_count, following_count, description, posts)
    @username = username
    @image = image
    @post_count = post_count
    @follower_count = follower_count
    @following_count = following_count
    @description = description
    @posts = posts
  end
end
