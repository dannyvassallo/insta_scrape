require 'spec_helper'

describe InstaScrape do

  it 'has a version number' do
    expect(InstaScrape::VERSION).not_to be nil
  end

  it 'connects to instagram\'s #test hashtag, scrapes, and maps posts' do
    scraper = InstaScrape.new
    scrape_result = scraper.hashtag("test")
    puts scrape_result[0]["link"]
    puts scrape_result[0]["image"]
    expect(scrape_result[0]["link"]).to_not eq(nil)
    expect(scrape_result[0]["image"]).to_not eq(nil)
  end
end
