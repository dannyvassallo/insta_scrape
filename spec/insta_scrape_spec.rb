require 'spec_helper'

describe InstaScrape do
  it 'has a version number' do
    expect(InstaScrape::VERSION).not_to be nil
  end

  it 'connects to instagram\'s #test hashtag, scrapes, and maps posts' do
    scrape_result = InstaScrape.hashtag("test")
    expect(scrape_result[0].link).to_not eq(nil)
    expect(scrape_result[0].image).to_not eq(nil)
    expect(scrape_result[0].text).to_not eq(nil)
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

  describe '#user_posts' do
    it 'connects to user\'s instagram scrapes just posts' do
      scrape_result = InstaScrape.user_posts('foofighters')
      expect(scrape_result[0].link).to_not eq(nil)
      expect(scrape_result[0].image).to_not eq(nil)
      expect(scrape_result[0].text).to_not eq(nil)
    end

    it 'returns extra data for each post' do
      scrape_result = InstaScrape.user_posts('foofighters', include_meta_data: true)
      expect(scrape_result[0].date).to_not eq(nil)
      expect(scrape_result[0].text).to_not eq(nil)
      expect(scrape_result[0].username).to_not eq(nil)
      expect(scrape_result[0].hi_res_image).to_not eq(nil)
      expect(scrape_result[0].likes).to_not eq(nil)
    end

    it 'detects private account' do
      expect {
        InstaScrape.user_posts('patrik_dal_nic')
      }.to raise_error(InstaScrape::PrivateAccountError)
    end
  end

  describe '#long_scrape_hashtag' do
    it 'connects to instagram hashtag long_scrapes \'test\' hashtag and gets over 200 posts' do
      scrape_result = InstaScrape.long_scrape_hashtag('test', 30)
      expect(scrape_result.length).to be > 200
    end

    it 'returns extra data for each post' do
      scrape_result = InstaScrape.long_scrape_hashtag('test', 1, include_meta_data: true)
      expect(scrape_result[0].date).to_not eq(nil)
      expect(scrape_result[0].text).to_not eq(nil)
      expect(scrape_result[0].username).to_not eq(nil)
      expect(scrape_result[0].hi_res_image).to_not eq(nil)
      expect(scrape_result[0].likes).to_not eq(nil)
    end
  end

  describe '#long_scrape_users' do
    it 'connects to instagram hashtag long_scrapes a user and gets all posts' do
      post_count = InstaScrape.user_post_count('foofighters')
      scrape_result = InstaScrape.long_scrape_user_posts('foofighters', 30)
      expect(scrape_result.length.to_s).to be === post_count
    end

    it 'returns extra data for each post' do
      scrape_result = InstaScrape.long_scrape_user_posts('foofighters', 1, include_meta_data: true)
      expect(scrape_result[0].date).to_not eq(nil)
      expect(scrape_result[0].text).to_not eq(nil)
      expect(scrape_result[0].username).to_not eq(nil)
      expect(scrape_result[0].hi_res_image).to_not eq(nil)
      expect(scrape_result[0].likes).to_not eq(nil)
    end

    it 'detects private account' do
      expect {
        InstaScrape.long_scrape_user_posts('patrik_dal_nic', 30)
      }.to raise_error(InstaScrape::PrivateAccountError)
    end
  end

  it 'connects to instagram hashtag long_scrapes a user info with posts and gets all of them' do
    scrape_result = InstaScrape.long_scrape_user_info_and_posts('foofighters', 30)
    post_count = scrape_result.post_count
    expect(scrape_result.posts.length.to_s).to be === post_count
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
