require 'rspec'
require 'capybara/cucumber'
require 'pry'
require 'yaml'



Capybara.configure do |config|
  config.default_driver = :selenium_chrome
end
