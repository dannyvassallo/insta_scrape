require "insta_scrape/version"
require "capybara"
require "capybara/dsl"
require "capybara/poltergeist"
require "phantomjs"

Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path)
end

Capybara.default_driver = :poltergeist

class InstaScrape
  include Capybara::DSL

  def hashtag(hashtag)
    visit "https://www.instagram.com/explore/tags/#{hashtag}/"
    @posts = []
    all("article div div div a").each do |post|

      link = post["href"]
      image = post.find("img")["src"]

      info = {
        "link" => link,
        "image" => image
      }

      @posts << info

    end
    return @posts
  end
end
