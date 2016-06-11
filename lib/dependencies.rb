require "insta_scrape/version"
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }
require "capybara"
require "capybara/dsl"
require "capybara/poltergeist"
require "phantomjs"
require "init/poltergeist"
