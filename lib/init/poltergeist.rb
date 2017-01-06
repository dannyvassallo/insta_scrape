Capybara.register_driver :poltergeist do |app|
  driver = Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path)
  driver.add_header('Accept-Language', 'en')
  driver
end

Capybara.default_driver = :poltergeist
