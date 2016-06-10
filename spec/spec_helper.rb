$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "capybara"
require "capybara/dsl"
require "capybara/rspec"
require "capybara/poltergeist"
require "phantomjs"

Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path)
end

RSpec.configure do |config|
  config.include Capybara::DSL, :type => :feature
end

Capybara.default_driver = :poltergeist

require "insta_scrape"
