[![Build Status](https://travis-ci.org/dannyvassallo/insta_scrape.svg?branch=master)](https://travis-ci.org/dannyvassallo/insta_scrape)[![Gem Version](https://badge.fury.io/rb/insta_scrape.svg)](https://badge.fury.io/rb/insta_scrape)
![alt text](https://s3-us-west-2.amazonaws.com/instascrape/instascrapelogo.png "logo")
# InstaScrape

A ruby scraper for instagram in 2016. Because the hashtag deprecation in the API is just silly.
This gem is dependent on Capybara, PhantomJS, and Poltergeist.

Using this gem you can access multiple facets of the instagram API without needing authorization, most importantly the hashtag.

v.1.1.0 introducing "long_scrape" methods! Now with more instgram posts!

## Note

The number of results may vary when using certain methods as this isn't an official endpoint.

## Todo

* Built-in Pagination


## Installation

Add this line to your application's Gemfile:

```ruby
gem "insta_scrape"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install insta_scrape

## Usage

###Available methods

Long scrape method take two arguments -- (hashtag || username, time_in_seconds)
Each other method accepts only one argument - a hashtag or a username.


####Long Scrape Methods
```ruby
#These can take a while but produce the best results
#I would recommend running a background job to pull these scrapes

#long scrape a user and their posts
#depending on how long you run the scrape
#you can pull an entire user profile and all of their posts
#30 seconds is enough for a casual user (maybe less)
InstaScrape.long_scrape_user_info_and_posts('foofighters', 30)
#this does the same without pulling user info
InstaScrape.long_scrape_user_posts('foofighters', 30)

#pull all posts from a hashtag
#infinite scroll will run as long as the time passed in
InstaScrape.long_scrape_hashtag('test', 60)
#=> > 2k instagram posts! Tested in specs!
```

####Regular Methods
```ruby
#scrape a hashtag for as many results as possible
InstaScrape.hashtag("test")
#scrape all user info
InstaScrape.user_info("foofighters")
#scrape all user info and posts
InstaScrape.user_info_and_posts("foofighters")
#scrape just a users posts (as many as possible)
InstaScrape.user_posts("foofighters")
#scrape a users follower count
InstaScrape.user_follower_count("foofighters")
#scrape a users following count
InstaScrape.user_following_count("foofighters")
#scrape a users post count
InstaScrape.user_post_count("foofighters")
#scrape a users description
InstaScrape.user_description("foofighters")
```

####Hashtag, User Post, and Nested Posts Scrape

```ruby
#basic use case

#scrape_result = InstaScrape.user_info_and_posts("foofighters").posts
#scrape_result = InstaScrape.user_posts("foofighters")
scrape_result = InstaScrape.hashtag("test")
scrape_result.each do |post|
  puts post.image
  puts post.link
end
```

Here is a `.erb` example using MaterializeCSS to render the posts as cards:

```ruby
#in your controller or helper assuming you aren't storing the posts

#@posts = InstaScrape.user_info_and_posts("foofighters").posts
#@posts = InstaScrape.user_posts("foofighters")
@posts = InstaScrape.hashtag("test")
```

```ruby
# your .erb file
# access post attributes using dot notation
<div class="row">
  <% @posts.each do |post| %>
  <div class="col s12 m6 l4">
    <div class="card hoverable">
      <div class="card-image"><a href="<%= post.link %>"><img src="<%= post.image %>"></a></div>
      <div class="card-content">
        <!-- <p></p> -->
      </div>
      <div class="card-action center-align"><a class="btn black" href="<%= post.link %>">Open Post</a></div>
    </div>
  </div>
  <% end %>
</div>
```

####User Info

All user information is accessible using dot notation.
If we run:
```ruby
u = InstaScrape.user_info("foofighters")
```
We then have access to the following attributes:
```ruby
u.image
#returns => "https://instagram.fewr1-2.fna.fbcdn.net/t51.2885-19/11856782_370180896524950_961003442_a.jpg"
u.post_count
#returns => "305"
u.follower_count
#returns  => "1.5m"
u.following_count
#returns => "35"
u.description
#returns => "Foo Fighters Rock band smarturl.it/sonic-highways"

#and in the event you'd need it
u.username
#returns => "foofighters"
```

Each of these attributes is accessible using the methods listed above as well.

Using `u = InstaScrape.user_info_and_posts("foofighters")` will give access to the `u.posts` attribute and can be iterated through.
The example above covers this.

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

