class InstagramUserObject
  attr_accessor :image, :post_count
  def initialize(image, post_count)
    @image = image
    @post_count = post_count
  end
end
