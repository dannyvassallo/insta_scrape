class InstaScrape::InstagramPost
  attr_accessor :link, :image, :date, :text, :username, :hi_res_image
  def initialize(link, image, options = {})
    @image = image
    @link = link
    @date = options[:date]
    @text = options[:text]
    @username = options[:username]
    @hi_res_image = options[:hi_res_image]
  end
end
