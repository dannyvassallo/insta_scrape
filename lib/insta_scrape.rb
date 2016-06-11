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

    begin
      page.find('a', :text => "Load more", exact: true).click
      max_iteration = 10
      iteration = 0
      while iteration < max_iteration do
        iteration += 1
        5.times { page.execute_script "window.scrollBy(0,10000)" }
        sleep 0.2
      end
      iterate_through_posts
    rescue Capybara::ElementNotFound => e
      begin
        iterate_through_posts
      end
    end
  end

  private

  def iterate_through_posts
    all("article div div div a").each do |post|

      link = post["href"]
      image = post.find("img")["src"]

      info = {
        "link" => link,
        "image" => image
      }

      @posts << info

    end

    #log
    puts "POST COUNT: #{@posts.length}"

    #return result
    return @posts
  end

end

@insta_scrape = InstaScrape.new
