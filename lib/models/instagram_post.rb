class InstaScrape::InstagramPost
  attr_accessor :link, :image
  def initialize(link, image, text=nil, time=nil)
    @image = image
    @link = link
    @text = text
    @time = Time.new(time)
  end
end
