class InstaScrape::InstagramPost
  attr_accessor :link, :image, :date, :text, :username
  def initialize(link, image, options = {})
    @image = image
    @link = link
    @date = options[:date]
    @text = options[:text]
    @username = options[:username]
  end
end
