[![Build Status](https://travis-ci.org/dannyvassallo/insta_scrape.svg?branch=master)](https://travis-ci.org/dannyvassallo/insta_scrape)[![Gem Version](https://badge.fury.io/rb/insta_scrape.svg)](https://badge.fury.io/rb/insta_scrape)

# InstaScrape

A ruby scraper for instagram in 2016. Because the hashtag deprecation in the API is just silly.
This gem is dependent on Capybara, PhantomJS, and Poltergeist.

## Note

The number of results may vary as this isn't an official endpoint.

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
#InstaScrape takes one argument. In this case its the #test hashtag.
@insta_scrape = InstaScrape.new
scrape_result = @insta_scrape.hashtag("test")
scrape_result.each do |post|
  puts post["image"]
  puts post["link"]
end
```

Here is a `.erb` example using MaterializeCSS to render the posts as cards:
```ruby

#in your controller or helper assuming you aren't storing the posts
@insta_scrape = InstaScrape.new
@posts = @insta_scrape.hashtag("test")

# your .erb file
<% @posts.each do |post| %>
<div class="col s12 m6 l4">
  <div class="card hoverable">
    <div class="card-image"><a href="<%= post['link'] %>"><img src="<%= post['image'] %>"></a></div>
    <div class="card-content">
      <!-- <p></p> -->
    </div>
    <div class="card-action center-align"><a class="btn black" href="<%= post['link'] %>">Open Post</a></div>
  </div>
</div>
<% end %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Deployment / Build

```
gem build insta_scrape.gemspec
gem push insta_scrape-v.v.v.gem
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dannyvassallo/insta_scrape. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

