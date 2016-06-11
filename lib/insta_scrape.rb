require "insta_scrape/version"
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }
require "capybara"
require "capybara/dsl"
require "capybara/poltergeist"
require "phantomjs"

Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path)
end

Capybara.default_driver = :poltergeist

module InstaScrape
  extend Capybara::DSL

  def self.hashtag(hashtag)
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

  def self.user_info(username)
    visit "https://www.instagram.com/#{username}/"
    image = page.find('article header div img')["src"]
    within("header") do
      post_count_html = page.find('span', :text => "posts", exact: true)['innerHTML']
      @post_count = get_span_value(post_count_html)
      follower_count_html = page.find('span', :text => "followers", exact: true)['innerHTML']
      @follower_count = get_span_value(follower_count_html)
    end
    @user = InstagramUser.new(image, @post_count, @follower_count)
    # puts page.find('span', :text => "followers")
  end

  private

  def self.iterate_through_posts
    all("article div div div a").each do |post|

      link = post["href"]
      image = post.find("img")["src"]
      info = InstagramPost.new(link, image)
      @posts << info

    end

    #log
    puts "POST COUNT: #{@posts.length}"
    self.log_posts
    #return result
    return @posts
  end

  def self.log_posts
    @posts.each do |post|
      puts "\n"
      puts "Image: #{post.image}\n"
      puts "Link: #{post.link}\n"
    end
    puts "\n"
  end

  def self.get_span_value(element)
    begin_split = "\">"
    end_split = "</span>"
    return element[/#{begin_split}(.*?)#{end_split}/m, 1]
  end

end
