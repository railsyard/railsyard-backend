require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] = "test"
  require File.expand_path("../dummy/config/environment.rb",  __FILE__)

  require 'database_cleaner'
  require 'rspec/rails'
  require 'rspec/rails/mocha'
  require 'capybara/rspec'
  require 'capybara-webkit'
  require 'factory_girl_rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.

  RSpec.configure do |config|
    ### Mocha ###
    config.mock_with :mocha
    config.include FactoryGirl::Syntax::Methods

    ### Database Cleaner ###
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
    end
    config.before(:each) { DatabaseCleaner.clean }

    ### Capybara ###
    Capybara.register_driver :selenium_chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
    Capybara.default_driver = :rack_test
    Capybara.javascript_driver = ENV['TRAVIS'] ? :webkit : :selenium_chrome
    Capybara.default_selector = :css
    Capybara.ignore_hidden_elements = true
  end
end

Spork.each_run do
  ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')
  Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| load f }
  Dir[File.join(ENGINE_RAILS_ROOT, "lib/**/*.rb")].each { |f| load f }
  I18n.reload!
end
