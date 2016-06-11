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

  it 'connects to user\'s instagram scrapes and maps their info and posts' do
    scrape_result = InstaScrape.user_info_and_posts('foofighters')
    expect(scrape_result.follower_count).to_not eq(nil)
    expect(scrape_result.posts.length).to be > 20
  end

  it 'connects to user\'s instagram scrapes just posts' do
    scrape_result = InstaScrape.user_posts('foofighters')
    expect(scrape_result[0].link).to_not eq(nil)
    expect(scrape_result[0].image).to_not eq(nil)
  end

  it 'connects to a user and checks their post count' do
    scrape_result = InstaScrape.user_posts('foofighters')
    expect(scrape_result).to_not eq(nil)
  end

  it 'connects to a user and checks their follower count' do
    scrape_result = InstaScrape.user_follower_count('foofighters')
    expect(scrape_result).to_not eq(nil)
  end

  it 'connects to a user and checks their following count' do
    scrape_result = InstaScrape.user_following_count('foofighters')
    expect(scrape_result).to_not eq(nil)
  end

  it 'connects to a user and checks their post count' do
    scrape_result = InstaScrape.user_post_count('foofighters')
    expect(scrape_result).to_not eq(nil)
  end

  it 'connects to a user and checks their description' do
    scrape_result = InstaScrape.user_description('foofighters')
    expect(scrape_result).to_not eq(nil)
  end

end
