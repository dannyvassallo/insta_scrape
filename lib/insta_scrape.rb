require "dependencies"

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
    scrape_user_info(username)
    @user = InstagramUser.new(@image, @post_count, @follower_count, @following_count, @description)
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

  def self.scrape_user_info(username)
    visit "https://www.instagram.com/#{username}/"
    @image = page.find('article header div img')["src"]
    within("header") do
      post_count_html = page.find('span', :text => "posts", exact: true)['innerHTML']
      @post_count = get_span_value(post_count_html)
      follower_count_html = page.find('span', :text => "followers", exact: true)['innerHTML']
      @follower_count = get_span_value(follower_count_html)
      following_count_html = page.find('span', :text => "following", exact: true)['innerHTML']
      @following_count = get_span_value(following_count_html)
      description = page.find('h2').first(:xpath,".//..")['innerHTML']
      @description = Nokogiri::HTML(description).text
    end
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
