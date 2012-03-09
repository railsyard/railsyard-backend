# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'database_cleaner'
require 'rspec/rails'
require 'rspec/rails/mocha'
require 'capybara/rspec'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  ### Mocha ###
  config.mock_with :mocha

  ### Database Cleaner ###
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) { DatabaseCleaner.clean }

  ### Capybara ###
  Capybara.default_driver = :rack_test
  Capybara.javascript_driver = :webkit
  Capybara.default_selector = :css
  Capybara.ignore_hidden_elements = true
end
