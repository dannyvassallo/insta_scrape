# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'insta_scrape/version'

Gem::Specification.new do |spec|
  spec.name          = "insta_scrape"
  spec.version       = InstaScrape::VERSION
  spec.authors       = ["dannyvassallo"]
  spec.email         = ["danielvassallo87@gmail.com"]

  spec.summary       = %q{Use Instagram Hashtag Embeds in 2016}
  spec.description   = %q{A ruby scraper for instagram in 2016. Because the hashtag deprecation in the API is just silly. This gem is dependent on Capybara, PhantomJS, and Poltergeist. v.1.1.0 -- Introducing long_scrape methods! Get thousands of photo results on hashtags and full user profiles with ALL posts! See the documentation for API usage.}
  spec.homepage      = "https://github.com/dannyvassallo/insta_scrape"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "capybara", "~> 2.7.1", ">= 2.7.1"
  spec.add_development_dependency "phantomjs", "~> 2.1.1.0", ">= 2.1.1.0"
  spec.add_development_dependency "poltergeist", "~> 1.9.0", ">= 1.9.0"

  spec.add_runtime_dependency "capybara", "~> 2.7.1", ">= 2.7.1"
  spec.add_runtime_dependency "phantomjs", "~> 2.1.1.0", ">= 2.1.1.0"
  spec.add_runtime_dependency "poltergeist", "~> 1.9.0", ">= 1.9.0"

end
