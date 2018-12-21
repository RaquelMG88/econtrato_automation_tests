require 'rspec'
require 'capybara/cucumber'
require 'pry'
require 'yaml'
require 'faker'
require 'cpf_faker'
require 'ffaker'


 Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'http://automationpractice.com'
end
