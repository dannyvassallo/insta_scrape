class InstaScrape::InstagramPost
  attr_accessor :link, :image, :date
  def initialize(link, image, date=nil)
    @image = image
    @link = link
    @date = date
  end
end
