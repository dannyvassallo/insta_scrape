class InstagramUserWithPosts
  attr_accessor :image, :post_count, :follower_count, :following_count, :description, :posts
  def initialize(image, post_count, follower_count, following_count, description, posts)
    @image = image
    @post_count = post_count
    @follower_count = follower_count
    @following_count = following_count
    @description = description
    @posts = posts
  end
end
