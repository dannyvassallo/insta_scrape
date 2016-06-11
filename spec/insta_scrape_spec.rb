require 'spec_helper'

describe InstaScrape do

  it 'has a version number' do
    expect(InstaScrape::VERSION).not_to be nil
  end

  it 'connects to instagram\'s #test hashtag, scrapes, and maps posts' do
    scrape_result = InstaScrape.hashtag("test")
    scrape_result.each do |post|
      "Link: #{post.link}\nImage: #{post.image}\n"
    end
    expect(scrape_result[0].link).to_not eq(nil)
    expect(scrape_result[0].image).to_not eq(nil)
  end

  it 'connects to user\'s instagram scrapes and maps their info' do
    scrape_result = InstaScrape.user_info("dannyvassallo")
    expect(scrape_result.follower_count).to_not eq(nil)
  end
end
