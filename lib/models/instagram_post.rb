class InstaScrape::InstagramPost
  attr_accessor :link, :image, :text
  def initialize(link, image, text=nil)
    @image = image
    @link = link
    @text = text
  end
end
