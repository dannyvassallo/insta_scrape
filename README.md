# InstaScrape

A ruby scraper for instagram in 2016. Because the hashtag deprecation in the API is just silly.
This gem is dependent on Capybara, PhantomJS, and Poltergeist.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'insta_scrape'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install insta_scrape

## Usage

The scrape maps the response objects to an array. The objects currently have 2 attributes, "link" and "image".

The simplest use is the following case:

```ruby
scraper = InstaScrape.new
#InstaScrape takes one argument. In this case its the #test hashtag.
scrape_result = scraper.hashtag("test")
scrape_result.each do |post|
  puts post["image"]
  puts post["link"]
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dannyvassallo/insta_scrape. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

