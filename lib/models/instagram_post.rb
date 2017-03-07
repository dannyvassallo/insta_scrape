class InstaScrape::InstagramPost
  attr_accessor :link, :image, :username, :date, :text
  def initialize(link, image, options = {})
    @image = image
    @link = link
    @date = options[:date]
    @text = options[:text]
  end
end
