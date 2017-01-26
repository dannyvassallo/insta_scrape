class InstaScrape::InstagramPost
  attr_accessor :link, :image, :date, :text
  def initialize(link, image, date=nil, text=nil)
    @image = image
    @link = link
    @date = date
    @text = text
  end
end
